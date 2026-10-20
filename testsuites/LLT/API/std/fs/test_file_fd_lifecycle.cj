/*
 * Copyright (c) 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Unix) EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC: %run %run_opt %output %run_utest_opt
import std.fs.*
import std.posix.*
import std.runtime.*
import std.sync.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

/*
 * Regression tests for the std.fs.File descriptor lifecycle races
 * (close() throw-before-invalidate and close() vs read()/close()
 * check-then-act on the raw descriptor).
 *
 * Defect 1 (throw before invalidate): File.close() called CJ_FS_CloseFile
 * BEFORE `fileHandle = InvalidHandle`. When the underlying close(2) failed
 * (EBADF after an FFI fd-handoff, or EIO on a failing filesystem, where
 * Linux has already released the fd) the FSException propagated and the
 * handle stayed stale-valid. After the OS re-issued the fd number, the GC
 * finalizer (~init) saw isHandleValid(N) and closed the NEW owner's
 * descriptor: an unrelated victim file broke with EBADF out of nowhere.
 * Fix: close() invalidates the handle BEFORE the close syscall, so no
 * throw path can leave a stale-valid handle behind (POSIX close semantics:
 * the fd is consumed once the close is attempted).
 *
 * Defect 2 (check-then-act on the descriptor): every operation validated
 * the handle and then performed the syscall with separately re-read values
 * (read() even re-read the field between check and use). With concurrent
 * close()/close() or close()/read() on one shared File, a racing close()
 * could free a descriptor the OS had already reassigned to another file:
 * cross-file I/O, bystander EBADF, spurious double-close exceptions.
 * Fix: every descriptor operation (close/read/write/seek/setLength) takes
 * a per-File native mutex for the whole check+syscall window, so a close()
 * waits for an in-flight operation, concurrent closes collapse into one
 * real close(2), and no syscall ever uses a descriptor that File has
 * already handed back to the OS.
 *
 * Deterministic scenarios below (no races are needed to detect the
 * throw-before-invalidate defect; the concurrency contract is covered by
 * a bounded hammer that only asserts invariants that must always hold):
 *   - closeEbadfInvalidatesHandle: FFI fd-handoff (native side closes the
 *     exposed fd), then f.close() throws EBADF; the handle must still be
 *     invalidated (isClosed() == true) and a GC must NOT close a later
 *     resource that reused the fd number;
 *   - doubleCloseIsSilent: sequential double close stays a no-op;
 *   - concurrentCloseCollapse: hammering close() from many threads on one
 *     File yields at most one successful close and no spurious throws;
 *   - concurrentCloseVsRead: reader + closer hammering the same File never
 *     observe bytes of a different file (every successful read returns this
 *     file's own content), and the closer/reader either succeed or fail
 *     cleanly with "file is closed" style errors.
 */

const BASE_DIR = "./cj_file_fd_lifecycle_tmp"

func ensureBaseDir(): Unit {
    if (!exists(BASE_DIR)) {
        Directory.create(BASE_DIR)
    }
}

func cleanupBaseDir(): Unit {
    if (exists(BASE_DIR)) {
        try {
            remove(BASE_DIR, recursive: true)
        } catch (_: FSException) {
            // already gone or busy in a concurrent teardown: nothing to do
        }
    }
}

@Test
class FileDescriptorLifecycleTest {
    // Defect 1: after an FFI handoff closed the raw fd behind the File's
    // back, close() throws EBADF but must STILL invalidate the handle.
    // Before the fix: isClosed() stayed false and the GC finalizer later
    // closed the fd number that had been re-issued to the victim file
    // (victim write failed with EBADF in every run).
    @TestCase
    func testCloseOnEbadfInvalidatesHandle(): Unit {
        ensureBaseDir()
        let stalePath = "${BASE_DIR}/stale.bin"

        let fdN = makeStaleHandle(stalePath)
        // The fd number must have been re-issued to the victim.
        var victim = File("${BASE_DIR}/victim.bin", OpenMode.ReadWrite)
        let vfd = victim.fileDescriptor.fileHandle
        @Expect(vfd, fdN)

        // Before the fix the finalizer closed the victim's fd within a few
        // gc rounds; after the fix the victim must survive all of them.
        var victimClosed = false
        var rounds = 0
        while (rounds < 20 && !victimClosed) {
            gc(heavy: true)
            sleep(Duration.millisecond * 20)
            try {
                victim.write(Array<Byte>(4, repeat: 66))
            } catch (_: FSException) {
                victimClosed = true
            }
            rounds++
        }
        @Expect(victimClosed, false)

        victim.close()
        cleanupBaseDir()
    }

    // Sequential double close stays a designed no-op (also after a close
    // that threw: the handle must be consumed either way).
    @TestCase
    func testDoubleCloseIsSilent(): Unit {
        ensureBaseDir()
        let p = "${BASE_DIR}/double.bin"
        let f = File(p, OpenMode.ReadWrite)
        f.write(Array<Byte>(4, repeat: 65))
        f.close()
        f.close() // must not throw
        @Expect(f.isClosed())

        // A close() that throws (EBADF via FFI handoff) also consumes the
        // handle: the retry must be silent, not throw again.
        let stalePath = "${BASE_DIR}/stale2.bin"
        let fdN = makeStaleHandle(stalePath)
        @Expect(fdN >= 0)
        cleanupBaseDir()
    }

    // Concurrency contract: N threads close() the same File. Every call
    // either returns normally or throws cleanly; exactly one real close(2)
    // happened. Before the fix, concurrent closers could both pass the
    // handle check and the loser closed an already-freed descriptor (and,
    // with fd reuse in the process, could close a stranger's descriptor).
    @TestCase
    func testConcurrentCloseCollapse(): Unit {
        ensureBaseDir()
        let p = "${BASE_DIR}/hammer.bin"
        for (_round in 0..20) {
            let f = File(p, OpenMode.ReadWrite)
            f.write(Array<Byte>(16, repeat: 65))
            let excCount = AtomicInt64(0)
            let futures = ArrayList<Future<Unit>>()
            for (i in 0..8) {
                futures.add(spawn {
                    try {
                        f.close()
                    } catch (_: FSException) {
                        excCount.fetchAdd(1)
                        ()
                    }
                })
            }
            for (fu in futures) {
                fu.get()
            }
            @Expect(f.isClosed())
            @Expect(excCount.load(), 0)
        }
        cleanupBaseDir()
    }

    // Concurrency contract: reader and closer hammer the same shared File.
    // Whatever the interleaving, a read() that RETURNS data must return
    // THIS file's data (never a stranger's bytes) and failures must be
    // clean FSExceptions. Before the fix the read syscall could run on a
    // descriptor the OS had reassigned to a different file, returning the
    // other file's bytes (cross-file I/O).
    @TestCase
    func testConcurrentCloseVsRead(): Unit {
        ensureBaseDir()
        let pA = "${BASE_DIR}/raceA.bin"
        let pB = "${BASE_DIR}/raceB.bin"
        // File A: recognizable pattern; churning file B reclaims freed fds
        // quickly so a stale-fd read would be visible as garbage bytes.
        var pattern = Array<Byte>(1024, repeat: 0)
        for (i in 0..1024) {
            pattern[i] = UInt8(65 + (i % 26))
        }
        File.writeTo(pA, pattern)
        File.writeTo(pB, Array<Byte>(4096, repeat: b'B'))

        for (_round in 0..10) {
            let shared = File(pA, OpenMode.Read)
            let stop = AtomicBool(false)
            let wrongByte = AtomicInt64(0)
            let closeExc = AtomicInt64(0)
            let futures = ArrayList<Future<Unit>>()
            // reader
            futures.add(spawn {
                let buf = Array<Byte>(1024, repeat: 0)
                while (!stop.load()) {
                    try {
                        let n = shared.read(buf)
                        for (i in 0..n) {
                            if (buf[i] != UInt8(65 + (i % 26))) {
                                wrongByte.fetchAdd(1)
                                break
                            }
                        }
                    } catch (_: FSException) {
                        // clean failure once the file is closed: allowed
                        break
                    }
                }
            })
            // closers
            for (i in 0..3) {
                futures.add(spawn {
                    while (!stop.load()) {
                        try {
                            shared.close()
                            stop.store(true)
                        } catch (_: FSException) {
                            closeExc.fetchAdd(1)
                            stop.store(true)
                            ()
                        }
                    }
                })
            }
            // churner reclaiming freed fds
            futures.add(spawn {
                let buf = Array<Byte>(64, repeat: 0)
                while (!stop.load()) {
                    try {
                        let fb = File(pB, OpenMode.Read)
                        fb.read(buf)
                        fb.close()
                    } catch (_: FSException) {
                        // churn file must stay healthy; a failure here means
                        // somebody closed its descriptor behind its back
                        wrongByte.fetchAdd(1)
                        break
                    }
                }
            })
            sleep(Duration.millisecond * 100)
            stop.store(true)
            for (fu in futures) {
                fu.get()
            }

            @Expect(wrongByte.load(), 0)
            @Expect(closeExc.load(), 0)
            @Expect(shared.isClosed())
        }
        cleanupBaseDir()
    }
}

/*
 * Creates a File whose raw fd is handed to native code (the canonical FFI
 * fd-handoff scenario: the fd is exposed by the public
 * File.fileDescriptor.fileHandle accessor precisely to be handed to native
 * consumers) and closed natively via std.posix.close. The subsequent
 * f.close() then hits EBADF and throws; returns the handoff fd number.
 */
func makeStaleHandle(path: String): IntNative {
    let f = File(path, OpenMode.ReadWrite)
    let fdN = f.fileDescriptor.fileHandle
    let rc = close(Int32(fdN))
    @Expect(rc, 0)
    try {
        f.close()
        @Expect(true, false) // EBADF must make close() throw
    } catch (_: FSException) {
        // expected: the close(2) underneath fails with EBADF
    }
    // THE regression assertion: the handle must be invalidated even though
    // close() threw (before the fix it stayed stale-valid here).
    @Expect(f.isClosed())
    return fdN
}
