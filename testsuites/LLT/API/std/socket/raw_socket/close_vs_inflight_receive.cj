/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt

/*
 * Regression test: RawSocket.close() must not release the file descriptor
 * while a receive() is in flight on another thread. The unfixed library
 * released the fd immediately (plain isClosed check-then-act), so after
 * close() returned an in-flight receive() could keep issuing recv()/wait()
 * calls with the stale handle; once the OS recycled the fd number for a
 * newly created socket, the stale handle aliased that socket and consumed
 * its datagrams (cross-socket theft) or parked on it forever.
 *
 * Scenario (single-shot receiver, deterministic sequencing through the
 * public API only):
 *   - receiver thread parks in s1.receive() (no read timeout);
 *   - main wakes it with one datagram and then closes s1;
 *   - main creates s2 (the fd number may be recycled by the OS) and sends
 *     a marked "SECRET" datagram to s2;
 *   - s1's receive must never return the SECRET datagram (that would mean
 *     the stale handle read s2's queue); it either returns the datagram
 *     sent to s1 before the close or throws "already closed";
 *   - s2 must be able to receive its own datagram afterwards.
 */

import std.net.*
import std.time.*
import std.sync.*

@When[backend == "cjnative"]
const backend = true

const SECRET0: UInt8 = 83 // 'S'
const SECRET1: UInt8 = 69 // 'E'
const SECRET2: UInt8 = 67 // 'C'
const SECRET3: UInt8 = 82 // 'R'
const SECRET4: UInt8 = 69 // 'E'
const SECRET5: UInt8 = 84 // 'T'

func isSecretPayload(b: Array<Byte>, n: Int64): Bool {
    if (n < 6) {
        return false
    }
    return b[0] == SECRET0 && b[1] == SECRET1 && b[2] == SECRET2 &&
        b[3] == SECRET3 && b[4] == SECRET4 && b[5] == SECRET5
}

@Test
class TestRawSocketCloseVsInFlightReceive {
    /*
     * Core regression: an in-flight receive() on a socket closed by another
     * thread must never deliver a datagram that was sent to a different
     * socket created after the close (fd-reuse aliasing).
     */
    @TestCase
    func closeVsInFlightReceive_noCrossSocketTheft(): Unit {
        let iterations = if (backend) { 200 } else { 20 }
        for (i in 0..iterations) {
            let s1 = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
            let addr1 = Array<Byte>(16, repeat: 0)
            addr1[0] = 2
            addr1[1] = 0
            s1.bind(RawAddress(addr1))
            let port1 = s1.localAddress.addr

            let sender = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
            let outcome = AtomicInt64(0) // 0 pending, 1 exception, 2 d1, 3 SECRET(stolen), 4 zero
            let buf = Array<Byte>(64, repeat: 0)

            /* Single-shot receiver: the receive() call covers the whole
             * close race, so the fix's session protocol must hold for it. */
            spawn {
                try {
                    let n = s1.receive(buf, 0)
                    if (n == 0) {
                        outcome.store(4)
                    } else if (isSecretPayload(buf, n)) {
                        outcome.store(3) // STOLEN: datagram addressed to s2
                    } else {
                        outcome.store(2) // the D1 datagram sent before close
                    }
                } catch (e: Exception) {
                    outcome.store(1) // closed/timeout error is acceptable
                }
            }
            sleep(Duration.millisecond * 2)

            /* Wake the parked receiver, then close while it may still be
             * inside the receive() re-entry window. */
            let d1 = Array<Byte>(4, repeat: UInt8(65))
            sender.sendTo(RawAddress(port1), d1, 0)
            s1.close()

            /* s2 is created right after the close: on the unfixed library
             * the OS may hand it s1's recycled fd number. */
            let s2 = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
            let addr2 = Array<Byte>(16, repeat: 0)
            addr2[0] = 2
            addr2[1] = 0
            s2.bind(RawAddress(addr2))
            let port2 = s2.localAddress.addr

            let secret = Array<Byte>(10, repeat: UInt8(0))
            secret[0] = SECRET0
            secret[1] = SECRET1
            secret[2] = SECRET2
            secret[3] = SECRET3
            secret[4] = SECRET4
            secret[5] = SECRET5
            sender.sendTo(RawAddress(port2), secret, 0)

            /* The receiver must finish promptly (the close must not leave it
             * parked forever on a stale/reused handle). */
            let deadline = MonoTime.now() + Duration.millisecond * 2000
            var st = outcome.load()
            while (st == 0 && MonoTime.now() < deadline) {
                sleep(Duration.millisecond * 1)
                st = outcome.load()
            }
            @Expect(st != 0, true)

            /* The decisive assertion: the stale s1 receive must never
             * deliver s2's datagram. */
            @Expect(st != 3, true)

            /* s2 must still be able to receive its own datagram: on the
             * unfixed library a stolen datagram made this time out. */
            s2.readTimeout = Duration.millisecond * 1000
            let buf2 = Array<Byte>(64, repeat: 0)
            var s2GotOwn = false
            try {
                let n2 = s2.receive(buf2, 0)
                s2GotOwn = isSecretPayload(buf2, n2)
            } catch (e: Exception) {
                s2GotOwn = false
            }
            @Expect(s2GotOwn, true)

            s2.close()
            sender.close()
        }
    }

    /*
     * Control: a closed socket rejects new receive attempts with the
     * documented "already closed" error (unchanged behaviour).
     */
    @TestCase
    func receiveAfterClose_throwsClosed(): Unit {
        let rs = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let addr = Array<Byte>(16, repeat: 0)
        addr[0] = 2
        addr[1] = 0
        rs.bind(RawAddress(addr))
        rs.close()
        let buf = Array<Byte>(16, repeat: 0)
        try {
            rs.receive(buf, 0)
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Socket is already closed"), true)
        }
    }
}
