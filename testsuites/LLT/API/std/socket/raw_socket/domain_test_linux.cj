/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Linux) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Linux) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt

import std.net.*

const AF_INET: Int32 = 2
const AF_UNIX: Int32 = 1
const AF_INET6: Int32 = 10
const AF_NETLINK: Int32 = 16
const AF_PACKET: Int32 = 17

@Test
class TestDomain {
    let ipv4 = SocketDomain(AF_INET)
    let ipv6 = SocketDomain(AF_INET6)
    let unix = SocketDomain(AF_UNIX)
    let netlink = SocketDomain(AF_NETLINK)
    let packet = SocketDomain(AF_PACKET)

    @TestCase
    func test_init(): Unit {
        @Expect(ipv4, SocketDomain.IPV4)
        @Expect(ipv6, SocketDomain.IPV6)
        @Expect(unix, SocketDomain.UNIX)
        @Expect(netlink, SocketDomain.NETLINK)
        @Expect(packet, SocketDomain.PACKET)
    }

    @TestCase
    func test_toString(): Unit {
        @Expect(SocketDomain.IPV4.toString(), "IPv4")
        @Expect(SocketDomain.IPV6.toString(), "IPv6")
        @Expect(SocketDomain.UNIX.toString(), "unix")
        @Expect(SocketDomain(100).toString(), "Domain(100)")
        @Expect(SocketDomain.NETLINK.toString(), "netlink")
        @Expect(SocketDomain.PACKET.toString(), "packet")
    }

    @TestCase
    func test_hashCode(): Unit {
        @Expect(ipv4.hashCode(), SocketDomain.IPV4.hashCode())
        @Expect(ipv6.hashCode(), SocketDomain.IPV6.hashCode())
        @Expect(unix.hashCode(), SocketDomain.UNIX.hashCode())
        @Expect(SocketDomain(100).hashCode(), SocketDomain(100).hashCode())
        @Expect(netlink.hashCode(), SocketDomain.NETLINK.hashCode())
        @Expect(packet.hashCode(), SocketDomain.PACKET.hashCode())
    }
}
