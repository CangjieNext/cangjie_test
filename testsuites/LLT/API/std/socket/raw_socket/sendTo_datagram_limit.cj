/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt

import std.net.*
import std.time.*
import std.sync.*

@Test
class TestSendToDatagramLimit {
    // DATAGRAM sockets must reject payloads larger than 65507 bytes with an
    // exception thrown by the standard library itself (consistent with the
    // documented contract and UdpSocket.sendTo), instead of relying on the
    // OS-level limit.
    @TestCase
    func datagramOverLimitRejected(): Unit {
        let client = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let addr = RawAddress([2, 0, 39, 44, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0])
        try {
            client.sendTo(addr, Array<Byte>(65508, repeat: 0), 0)
            @Expect(1, 2)
        } catch (e: SocketException) {
            @Expect(e.message.contains("Cannot send datagram larger than 65507"), true)
        }
        client.close()
    }

    // A payload of exactly 65507 bytes is at the documented limit and must be
    // accepted by the standard library (OS may still reject it on some
    // platforms, so only "no standard-library exception" is asserted).
    @TestCase
    func datagramAtLimitAccepted(): Unit {
        let client = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let addr = RawAddress([2, 0, 39, 45, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0])
        try {
            client.sendTo(addr, Array<Byte>(65507, repeat: 0), 0)
        } catch (e: SocketException) {
            // If it fails here, it must be an OS-level failure, not the
            // standard-library 65507 check.
            @Expect(e.message.contains("Cannot send datagram larger than 65507"), false)
        }
        client.close()
    }

    // Regression: small payloads are unaffected by the limit check.
    @TestCase
    func smallPayloadUnaffected(): Unit {
        let server = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let client = RawSocket(SocketDomain.IPV4, SocketType.DATAGRAM, ProtocolType.UDP)
        let addr = RawAddress([2, 0, 39, 46, 127, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0])
        server.bind(addr)
        client.sendTo(addr, "hello".toArray(), 0)
        let buf = Array<Byte>(32, repeat: 0)
        let (_, n) = server.receiveFrom(buf, 0)
        @Expect(n, 5)
        client.close()
        server.close()
    }
}
