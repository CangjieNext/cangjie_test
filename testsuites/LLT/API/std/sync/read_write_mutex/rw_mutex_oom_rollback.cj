/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %f %cmp_opt -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan ok

/*
 * Test description: ReentrantReadWriteMutex must not leak the shared
 * reader count when a reader's post-CAS bookkeeping throws.
 *
 * Regression for MC-3: readLock/tryReadLock commits the share-CAS
 * (state += SHARE_UNIT) and then calls incThreadReadCount(), which may
 * allocate and throw OutOfMemoryError under a constrained heap. On the
 * unfixed std the share unit is leaked: no reader exists, yet
 * tryWriteLock() returns false forever and a writer thread starves.
 * The fixed std rolls the share count back (state -= SHARE_UNIT) before
 * rethrowing, so the lock remains usable.
 *
 * Public-API construction: hammer readLock/unlock concurrently under a
 * small heap (cjHeapSize) so the bookkeeping allocation inside
 * incThreadReadCount occasionally fails after the share-CAS; after the
 * pressure phase the lock must still be writable.
 *
 * Note: whether the OOM lands exactly in the post-CAS window depends on
 * GC timing; the public API cannot pin it deterministically (the fix
 * report uses a fault-injected std source for the deterministic red/green
 * pair). This test is the public-API regression guard: on the fixed std
 * the lock remains writable after heavy read traffic.
 *
 * Test API:
 *   - ReentrantReadWriteMutex.readMutex.lock()/unlock()
 *   - ReentrantReadWriteMutex.writeMutex.tryLock()/unlock()
 */

internal import std.sync.{AtomicInt64, ReentrantReadWriteMutex}
internal import std.collection.ArrayList

main(): Unit {
    let rwm = ReentrantReadWriteMutex()
    let futs = ArrayList<Future<Unit>>()
    let done = AtomicInt64(0)

    // Pressure phase: many concurrent read-lock cycles. Under a small heap
    // some bookkeeping allocations fail after the share-CAS.
    for (_ in 0..8) {
        let f = spawn {
            while (done.load() == 0) {
                try {
                    rwm.readMutex.lock()
                    rwm.readMutex.unlock()
                } catch (e: OutOfMemoryError) {
                    // application catches and survives (cf. Future.execute)
                }
            }
        }
        futs.add(f)
    }

    sleep(Duration.second * 2)
    done.store(1)
    for (f in futs) {
        f.get()
    }

    // After the pressure phase the lock must still be writable: if a share
    // unit was leaked, tryWriteLock stays false even though no reader holds
    // the lock.
    var writable = false
    for (_ in 0..20) {
        if (rwm.writeMutex.tryLock()) {
            rwm.writeMutex.unlock()
            writable = true
            break
        }
        sleep(Duration.millisecond * 50)
    }
    if (!writable) {
        println("not-ok")
        return
    }
    println("ok")
}
