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

const IPPROTO_ICMP: Int32 = 1
const IPPROTO_IPV4: Int32 = 4
const IPPROTO_TCP: Int32 = 6
const IPPROTO_UDP: Int32 = 17
const IPPROTO_IPV6: Int32 = 41
const IPPROTO_RAW: Int32 = 255

@Test
class TestProtocol {
    let unspecified: ProtocolType = ProtocolType(0)
    let ipv4: ProtocolType = ProtocolType(IPPROTO_IPV4)
    let ipv6: ProtocolType = ProtocolType(IPPROTO_IPV6)
    let icmp: ProtocolType = ProtocolType(IPPROTO_ICMP)
    let tcp: ProtocolType = ProtocolType(IPPROTO_TCP)
    let udp: ProtocolType = ProtocolType(IPPROTO_UDP)
    let raw: ProtocolType = ProtocolType(IPPROTO_RAW)

    @TestCase
    func test_init(): Unit {
        @Expect(ipv4, ProtocolType.IPV4)
        @Expect(ipv6, ProtocolType.IPV6)
        @Expect(icmp, ProtocolType.ICMP)
        @Expect(tcp, ProtocolType.TCP)
        @Expect(udp, ProtocolType.UDP)
        @Expect(raw, ProtocolType.RAW)
        @Expect(unspecified, ProtocolType.Unspecified)
    }

    @TestCase
    func test_toString(): Unit {
        @Expect(ProtocolType.IPV4.toString(), "IPv4")
        @Expect(ProtocolType.IPV6.toString(), "IPv6")
        @Expect(ProtocolType.ICMP.toString(), "ICMP")
        @Expect(ProtocolType.TCP.toString(), "TCP")
        @Expect(ProtocolType.UDP.toString(), "UDP")
        @Expect(ProtocolType.RAW.toString(), "RAW")
        @Expect(ProtocolType.Unspecified.toString(), "Unspecified")
        @Expect(ProtocolType(100).toString(), "Protocol(100)")
    }

    @TestCase
    func test_hashCode(): Unit {
        @Expect(ipv4.hashCode(), ProtocolType.IPV4.hashCode())
        @Expect(ipv6.hashCode(), ProtocolType.IPV6.hashCode())
        @Expect(icmp.hashCode(), ProtocolType.ICMP.hashCode())
        @Expect(tcp.hashCode(), ProtocolType.TCP.hashCode())
        @Expect(udp.hashCode(), ProtocolType.UDP.hashCode())
        @Expect(raw.hashCode(), ProtocolType.RAW.hashCode())
        @Expect(unspecified.hashCode(), ProtocolType.Unspecified.hashCode())
    }
}
