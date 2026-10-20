/*
 * Copyright (c) 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*

/*
 * Regression test for issue 992 (defect 2):
 * DopraOtherSocketImpl.createBuffer (std/net socket_ffi_cjnative_impl.cj)
 * allocated the native write buffer for UDP/UNIX sockets as 0xffff = 65535
 * bytes, but the write/send path chunked and checked with
 * SOCK_WRITE_BUFFER_SIZE = 64 * 1024 = 65536 (socket_ffi.cj:20, whose XXX
 * comment already noted the mismatch). CJ_SOCKET_BufferWCopy
 * (native/socket_buffer.c) rejects any copyLen > wBufSize, so
 *   - UnixSocket.write() with a total size >= 65536 (the first chunk is
 *     exactly 65536), and
 *   - UnixDatagramSocket.sendTo() with a payload >= 65536
 * deterministically threw SocketException("Failed to write data: socket copy
 * error.") before any syscall; the data was never transmitted. 65535-byte
 * operations on the same live sockets always succeeded, proving a permanent
 * size gate. The documented contract contradicts this: StreamingSocket.write
 * promises copy-and-schedule with blocking (chunking, no hard cap), and
 * UnixDatagramSocket's doc explicitly states "Unlike UDP, Unix Domain socket
 * don't limit datagram size to 64Kib".
 *
 * Both cases here assert the documented behavior: >= 65536-byte writes on a
 * Unix stream socket must succeed (the library is free to chunk internally),
 * and UnixDatagramSocket.sendTo at kernel-accepted sizes must not throw from
 * an internal buffer-size mismatch. 65535-byte controls must keep working.
 */

let pathSeq = AtomicInt64(0)

func tempSocketPath(name: String): String {
    // Unique per-run path to avoid stale files between executions: Unix
    // time in nanoseconds plus a per-call sequence number; two processes
    // virtually never produce the same pair.
    let salt = DateTime.now().toUnixTimeStamp().toNanoseconds()
    "/tmp/cj_llt_992_${name}_${salt}_${pathSeq.fetchAdd(1)}.sock"
}

@Test
class Test_UnixSocket_Write_At_Least_64KiB {
    @TestCase
    func streamWrite64KiBChunksSucceed(): Unit {
        let path = tempSocketPath("stream")
        let server = UnixServerSocket(bindAt: path)
        server.bind()

        let totalToExpect: Int64 = 65535 + 65536 + 65537
        let drained = AtomicInt64(0)
        let readerFut = spawn {
            let conn = server.accept()
            conn.readTimeout = Duration.millisecond * 10000
            let buf = Array<Byte>(65536, repeat: 0)
            while (true) {
                try {
                    let n = conn.read(buf)
                    if (n <= 0) {
                        break
                    }
                    drained.fetchAdd(n)
                } catch (e: Exception) {
                    break // timeout after all data drained
                }
            }
        }

        let client = UnixSocket(path)
        client.connect()
        client.writeTimeout = Duration.millisecond * 10000

        // Control: 65535 must succeed (this never failed).
        client.write(Array<Byte>(65535, repeat: b'A'))

        // The defect: every write whose first chunk is exactly 65536 threw
        // "Failed to write data: socket copy error." before any syscall.
        client.write(Array<Byte>(65536, repeat: b'B'))
        client.write(Array<Byte>(65537, repeat: b'C'))

        client.close()
        readerFut.get(Duration.second * 30)
        server.close()

        @Expect(drained.load() >= totalToExpect, true)
    }
}

@Test
class Test_UnixDatagramSocket_SendTo_At_Least_64KiB {
    @TestCase
    func dgramSendToAbove64KiBSucceeds(): Unit {
        let recvPath = tempSocketPath("dgram_recv")
        let sendPath = tempSocketPath("dgram_send")
        let receiver = UnixDatagramSocket(bindAt: recvPath)
        receiver.bind()
        receiver.receiveTimeout = Duration.millisecond * 5000

        let dgramCount = AtomicInt64(0)
        let dgramBytes = AtomicInt64(0)
        let recvFut = spawn {
            let buf = Array<Byte>(200000, repeat: 0)
            while (true) {
                try {
                    let (_, sz) = receiver.receiveFrom(buf)
                    dgramCount.fetchAdd(1)
                    dgramBytes.fetchAdd(sz)
                } catch (e: Exception) {
                    break // receive timeout: no more datagrams
                }
            }
        }

        let sender = UnixDatagramSocket(bindAt: sendPath)
        sender.bind()
        sender.sendTimeout = Duration.millisecond * 5000
        let recipient = UnixSocketAddress(recvPath)

        // Control: 65535 must succeed (this never failed).
        sender.sendTo(recipient, Array<Byte>(65535, repeat: b'A'))

        // The defect: 65536/100000 threw "Failed to write data: socket copy
        // error." before any syscall.
        sender.sendTo(recipient, Array<Byte>(65536, repeat: b'B'))
        sender.sendTo(recipient, Array<Byte>(100000, repeat: b'C'))

        recvFut.get(Duration.second * 30)
        sender.close()
        receiver.close()

        // All three sendTo calls completed without the internal size-gate
        // SocketException (the defect). Note: the receiving side of
        // receiveFrom is bounded by the socket's separate read buffer
        // (rBufSize 0xffff), so oversized datagrams are reported truncated
        // on receive; asserting the exact received byte count is out of
        // scope for this write-side regression. Assert that all three
        // datagrams arrived.
        @Expect(dgramCount.load() == 3, true)
    }
}
