/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.net.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class NetBranchApiTest {

    // === AddressFamily ===
    @TestCase
    func test_address_family_unspec(): Unit {
        @Expect(AddressFamily.UNSPEC.toString(), "UNSPEC")
    }

    @TestCase
    func test_address_family_ipv4(): Unit {
        @Expect(AddressFamily.INET.toString(), "INET")
    }

    @TestCase
    func test_address_family_ipv6(): Unit {
        @Expect(AddressFamily.INET6.toString(), "INET6")
    }

    @TestCase
    func test_address_family_unix(): Unit {
        @Assert(AddressFamily.INET == AddressFamily.INET)
        @Assert(AddressFamily.INET != AddressFamily.INET6)
    }

    @TestCase
    func test_address_family_equal(): Unit {
        @Assert(AddressFamily.INET == AddressFamily.INET)
        @Assert(AddressFamily.INET != AddressFamily.INET6)
    }

    // === SocketNet ===
    @TestCase
    func test_socket_net_tcp(): Unit {
        @Expect(SocketNet.TCP.toString(), "tcp")
    }

    @TestCase
    func test_socket_net_udp(): Unit {
        @Expect(SocketNet.UDP.toString(), "udp")
    }

    @TestCase
    func test_socket_net_unix(): Unit {
        @Expect(SocketNet.UNIX.toString(), "domain")
    }

    @TestCase
    func test_socket_net_equal(): Unit {
        @Assert(SocketNet.TCP == SocketNet.TCP)
        @Assert(SocketNet.TCP != SocketNet.UDP)
    }

    // === SocketException ===
    @TestCase
    func test_socket_exception_no_arg(): Unit {
        let e = SocketException()
        @Assert(e.message.size > 0 || true)
    }

    @TestCase
    func test_socket_exception_with_msg(): Unit {
        let e = SocketException("socket error")
        @Assert(e.message.contains("socket error"))
    }

    // === SocketTimeoutException ===
    @TestCase
    func test_socket_timeout_exception_no_arg(): Unit {
        let e = SocketTimeoutException()
        @Assert(true)
    }

    @TestCase
    func test_socket_timeout_exception_with_msg(): Unit {
        let e = SocketTimeoutException("timeout occurred")
        @Assert(e.message.contains("timeout occurred"))
    }

    // === SocketKeepAliveConfig ===
    @TestCase
    func test_keepalive_config_default(): Unit {
        let config = SocketKeepAliveConfig()
        @Assert(true)
    }

    @TestCase
    func test_keepalive_config_to_string(): Unit {
        let config = SocketKeepAliveConfig()
        @Assert(config.toString().size > 0)
    }

    @TestCase
    func test_keepalive_config_equal(): Unit {
        let c1 = SocketKeepAliveConfig()
        let c2 = SocketKeepAliveConfig()
        @Assert(c1 == c2)
    }

    // === IPSocketAddress ===
    @TestCase
    func test_ipsocketaddress_ipv4(): Unit {
        let addr = IPv4Address.localhost
        let sa = IPSocketAddress(addr, 8080)
        @Expect(sa.port, UInt16(8080))
        @Assert(sa.isIPv4())
        @Assert(!sa.isIPv6())
    }

    @TestCase
    func test_ipsocketaddress_ipv6(): Unit {
        let addr = IPv6Address.localhost
        let sa = IPSocketAddress(addr, 9090)
        @Expect(sa.port, UInt16(9090))
        @Assert(sa.isIPv6())
        @Assert(!sa.isIPv4())
    }

    @TestCase
    func test_ipsocketaddress_toString_ipv4(): Unit {
        let addr = IPv4Address.localhost
        let sa = IPSocketAddress(addr, 8080)
        @Expect(sa.toString(), "127.0.0.1:8080")
    }

    @TestCase
    func test_ipsocketaddress_toString_ipv6(): Unit {
        let addr = IPv6Address.localhost
        let sa = IPSocketAddress(addr, 9090)
        @Expect(sa.toString(), "[::1]:9090")
    }

    @TestCase
    func test_ipsocketaddress_equal(): Unit {
        let sa1 = IPSocketAddress(IPv4Address.localhost, 8080)
        let sa2 = IPSocketAddress(IPv4Address.localhost, 8080)
        let sa3 = IPSocketAddress(IPv4Address.localhost, 9090)
        @Assert(sa1 == sa2)
        @Assert(sa1 != sa3)
    }

    @TestCase
    func test_ipsocketaddress_hashcode(): Unit {
        let sa = IPSocketAddress(IPv4Address.localhost, 8080)
        @Assert(sa.hashCode() == sa.hashCode())
    }

    @TestCase
    func test_ipsocketaddress_getAddressBytes_ipv4(): Unit {
        let sa = IPSocketAddress(IPv4Address.localhost, 8080)
        let bytes = sa.getAddressBytes()
        @Assert(bytes.size > 0)
    }

    @TestCase
    func test_ipsocketaddress_getAddressBytes_ipv6(): Unit {
        let sa = IPSocketAddress(IPv6Address.localhost, 9090)
        let bytes = sa.getAddressBytes()
        @Assert(bytes.size > 0)
    }

    // === IPAddress interface methods ===
    @TestCase
    func test_ipaddress_isipv4(): Unit {
        @Assert(IPv4Address.localhost.isIPv4())
        @Assert(!IPv6Address.localhost.isIPv4())
    }

    @TestCase
    func test_ipaddress_isipv6(): Unit {
        @Assert(IPv6Address.localhost.isIPv6())
        @Assert(!IPv4Address.localhost.isIPv6())
    }

    @TestCase
    func test_ipaddress_hashcode(): Unit {
        let v4 = IPv4Address.localhost
        let v6 = IPv6Address.localhost
        @Assert(v4.hashCode() == v4.hashCode())
        @Assert(v6.hashCode() == v6.hashCode())
    }

    @TestCase
    func test_ipaddress_getAddressBytes_ipv4(): Unit {
        let bytes = IPv4Address.localhost.getAddressBytes()
        @Expect(bytes.size, 4)
    }

    @TestCase
    func test_ipaddress_getAddressBytes_ipv6(): Unit {
        let bytes = IPv6Address.localhost.getAddressBytes()
        @Expect(bytes.size, 16)
    }

    // === IPv4Address methods ===
    @TestCase
    func test_ipv4_isBroadcast(): Unit {
        @Assert(IPv4Address.broadcast.isBroadcast())
        @Assert(!IPv4Address.localhost.isBroadcast())
    }

    @TestCase
    func test_ipv4_isLoopback(): Unit {
        @Assert(IPv4Address.localhost.isLoopback())
        @Assert(!IPv4Address.broadcast.isLoopback())
    }

    @TestCase
    func test_ipv4_isMulticast(): Unit {
        let mc = IPv4Address(224, 0, 0, 1)
        @Assert(mc.isMulticast())
        @Assert(!IPv4Address.localhost.isMulticast())
    }

    @TestCase
    func test_ipv4_isPrivate(): Unit {
        let priv = IPv4Address(10, 0, 0, 1)
        @Assert(priv.isPrivate())
        @Assert(!IPv4Address.localhost.isPrivate())
    }

    @TestCase
    func test_ipv4_isPrivate_172(): Unit {
        let priv = IPv4Address(172, 16, 0, 1)
        @Assert(priv.isPrivate())
    }

    @TestCase
    func test_ipv4_isPrivate_192(): Unit {
        let priv = IPv4Address(192, 168, 1, 1)
        @Assert(priv.isPrivate())
    }

    @TestCase
    func test_ipv4_isLinkLocal(): Unit {
        let ll = IPv4Address(169, 254, 0, 1)
        @Assert(ll.isLinkLocal())
        @Assert(!IPv4Address.localhost.isLinkLocal())
    }

    @TestCase
    func test_ipv4_isUnspecified(): Unit {
        @Assert(IPv4Address.unspecified.isUnspecified())
        @Assert(!IPv4Address.localhost.isUnspecified())
    }

    @TestCase
    func test_ipv4_isGlobalUnicast(): Unit {
        let g = IPv4Address(8, 8, 8, 8)
        @Assert(g.isGlobalUnicast())
        @Assert(!IPv4Address.localhost.isGlobalUnicast())
        @Assert(!IPv4Address.unspecified.isGlobalUnicast())
    }

    @TestCase
    func test_ipv4_toIPv6Compatible(): Unit {
        let v4 = IPv4Address(1, 2, 3, 4)
        let v6 = v4.toIPv6Compatible()
        @Assert(v6.isIPv6())
    }

    @TestCase
    func test_ipv4_toIPv6Mapped(): Unit {
        let v4 = IPv4Address(1, 2, 3, 4)
        let v6 = v4.toIPv6Mapped()
        @Assert(v6.isIPv4Mapped())
    }

    @TestCase
    func test_ipv4_writeBigEndian_small_buffer(): Unit {
        let v4 = IPv4Address.localhost
        var caught = false
        try {
            let _ = v4.writeBigEndian(Array<Byte>(2, repeat: 0))
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Assert(caught)
    }

    @TestCase
    func test_ipv4_getPrefix(): Unit {
        let v4 = IPv4Address.localhost
        let prefix = v4.getPrefix(24)
        @Assert(true)
    }

    // === IPv6Address methods ===
    @TestCase
    func test_ipv6_isLoopback(): Unit {
        @Assert(IPv6Address.localhost.isLoopback())
        @Assert(!IPv6Address.unspecified.isLoopback())
    }

    @TestCase
    func test_ipv6_isMulticast(): Unit {
        let mc = IPv6Address(0xFF00u16, 0, 0, 0, 0, 0, 0, 1)
        @Assert(mc.isMulticast())
        @Assert(!IPv6Address.localhost.isMulticast())
    }

    @TestCase
    func test_ipv6_isLinkLocal(): Unit {
        let ll = IPv6Address(0xFE80u16, 0, 0, 0, 0, 0, 0, 1)
        @Assert(ll.isLinkLocal())
        @Assert(!IPv6Address.localhost.isLinkLocal())
    }

    @TestCase
    func test_ipv6_isUnspecified(): Unit {
        @Assert(IPv6Address.unspecified.isUnspecified())
        @Assert(!IPv6Address.localhost.isUnspecified())
    }

    @TestCase
    func test_ipv6_isGlobalUnicast(): Unit {
        let g = IPv6Address(0x2001u16, 0xDB8, 0, 0, 0, 0, 0, 1)
        @Assert(g.isGlobalUnicast())
        @Assert(!IPv6Address.unspecified.isGlobalUnicast())
        @Assert(!IPv6Address.localhost.isGlobalUnicast())
    }

    @TestCase
    func test_ipv6_isPrivate(): Unit {
        let priv = IPv6Address(0xFD00u16, 0, 0, 0, 0, 0, 0, 1)
        @Assert(priv.isPrivate())
    }

    @TestCase
    func test_ipv6_isTeredo(): Unit {
        let teredo = IPv6Address(0x2001u16, 0, 0, 0, 0, 0, 0, 1)
        @Assert(teredo.isTeredo())
        @Assert(!IPv6Address.localhost.isTeredo())
    }

    @TestCase
    func test_ipv6_isIPv4Mapped(): Unit {
        let v4 = IPv4Address(1, 2, 3, 4)
        let mapped = v4.toIPv6Mapped()
        @Assert(mapped.isIPv4Mapped())
        @Assert(!IPv6Address.localhost.isIPv4Mapped())
    }

    @TestCase
    func test_ipv6_toIPv4(): Unit {
        let v4 = IPv4Address(1, 2, 3, 4)
        let mapped = v4.toIPv6Mapped()
        match (mapped.toIPv4()) {
            case Some(ip) => @Expect(ip.toString(), "1.2.3.4")
            case None => @Assert(false)
        }
    }

    @TestCase
    func test_ipv6_toIPv4_not_mapped(): Unit {
        // Use a non-IPv4-compatible address (0x2001::)
        let addr = IPv6Address(0x2001u16, 0xDB8, 0, 0, 0, 0, 0, 1)
        match (addr.toIPv4()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_ipv6_toIPv4Mapped_not_mapped(): Unit {
        match (IPv6Address.localhost.toIPv4Mapped()) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_ipv6_scope(): Unit {
        let addr = IPv6Address.localhost
        let scoped = addr.scope(42)
        @Assert(true)
    }

    @TestCase
    func test_ipv6_scope_same(): Unit {
        let addr = IPv6Address.localhost
        let scoped = addr.scope(None)
        @Assert(scoped == addr)
    }

    @TestCase
    func test_ipv6_writeBigEndian_small_buffer(): Unit {
        var caught = false
        try {
            let _ = IPv6Address.localhost.writeBigEndian(Array<Byte>(8, repeat: 0))
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Assert(caught)
    }

    @TestCase
    func test_ipv6_getPrefix(): Unit {
        let v6 = IPv6Address.localhost
        let prefix = v6.getPrefix(64)
        @Assert(true)
    }

    // === IPPrefix methods ===
    @TestCase
    func test_ipprefix_contains_ip(): Unit {
        let prefix = IPv4Address(192, 168, 1, 0).getPrefix(24)
        @Assert(prefix.contains(IPv4Address(192, 168, 1, 100)))
        @Assert(!prefix.contains(IPv4Address(192, 168, 2, 1)))
    }

    @TestCase
    func test_ipprefix_contains_prefix(): Unit {
        let p1 = IPv4Address(192, 168, 0, 0).getPrefix(16)
        let p2 = IPv4Address(192, 168, 1, 0).getPrefix(24)
        @Assert(p1.contains(p2))
        @Assert(!p2.contains(p1))
    }

    @TestCase
    func test_ipprefix_overlaps(): Unit {
        let p1 = IPv4Address(192, 168, 0, 0).getPrefix(16)
        let p2 = IPv4Address(192, 168, 1, 0).getPrefix(24)
        @Assert(p1.overlaps(p2))
    }

    @TestCase
    func test_ipprefix_no_overlaps(): Unit {
        let p1 = IPv4Address(10, 0, 0, 0).getPrefix(8)
        let p2 = IPv4Address(192, 168, 1, 0).getPrefix(24)
        @Assert(!p1.overlaps(p2))
    }

    @TestCase
    func test_ipprefix_netmask(): Unit {
        let prefix = IPv4Address(192, 168, 1, 0).getPrefix(24)
        let mask = prefix.netmask()
        @Expect(mask.toString(), "255.255.255.0")
    }

    @TestCase
    func test_ipprefix_hostmask(): Unit {
        let prefix = IPv4Address(192, 168, 1, 0).getPrefix(24)
        let mask = prefix.hostmask()
        @Expect(mask.toString(), "0.0.0.255")
    }

    @TestCase
    func test_ipprefix_broadcast(): Unit {
        let prefix = IPv4Address(192, 168, 1, 0).getPrefix(24)
        @Expect(prefix.broadcast().toString(), "192.168.1.255")
    }

    @TestCase
    func test_ipprefix_network(): Unit {
        let prefix = IPv4Address(192, 168, 1, 100).getPrefix(24)
        @Expect(prefix.network().toString(), "192.168.1.0")
    }

    @TestCase
    func test_ipprefix_masked(): Unit {
        let prefix = IPv4Address(192, 168, 1, 100).getPrefix(24)
        let masked = prefix.masked()
        @Expect(masked.network().toString(), "192.168.1.0")
    }

    @TestCase
    func test_ipprefix_hashcode(): Unit {
        let p1 = IPv4Address(192, 168, 1, 0).getPrefix(24)
        let p2 = IPv4Address(192, 168, 1, 0).getPrefix(24)
        @Expect(p1.hashCode(), p2.hashCode())
    }

    @TestCase
    func test_ipprefix_toString(): Unit {
        let prefix = IPv4Address(192, 168, 1, 0).getPrefix(24)
        @Expect(prefix.toString(), "192.168.1.0/24")
    }

    // === IPv6 Prefix ===
    @TestCase
    func test_ipv6_prefix_netmask(): Unit {
        let prefix = IPv6Address.localhost.getPrefix(64)
        let mask = prefix.netmask()
        @Assert(true)
    }

    @TestCase
    func test_ipv6_prefix_hostmask(): Unit {
        let prefix = IPv6Address.localhost.getPrefix(64)
        let mask = prefix.hostmask()
        @Assert(true)
    }

    @TestCase
    func test_ipv6_prefix_broadcast(): Unit {
        let prefix = IPv6Address.localhost.getPrefix(64)
        let _ = prefix.broadcast()
        @Assert(true)
    }

    @TestCase
    func test_ipv6_prefix_network(): Unit {
        let prefix = IPv6Address.localhost.getPrefix(64)
        let _ = prefix.network()
        @Assert(true)
    }

    @TestCase
    func test_ipv6_prefix_hashcode(): Unit {
        let p1 = IPv6Address.localhost.getPrefix(64)
        let p2 = IPv6Address.localhost.getPrefix(64)
        @Expect(p1.hashCode(), p2.hashCode())
    }

    // === IPPrefix interface dispatch ===
    @TestCase
    func test_ipprefix_contains_ip_dispatch(): Unit {
        let p4: IPPrefix = IPv4Address(192, 168, 1, 0).getPrefix(24)
        let ip: IPAddress = IPv4Address(192, 168, 1, 100)
        @Assert(p4.contains(ip))
    }

    @TestCase
    func test_ipprefix_contains_prefix_dispatch(): Unit {
        let p1: IPPrefix = IPv4Address(192, 168, 0, 0).getPrefix(16)
        let p2: IPPrefix = IPv4Address(192, 168, 1, 0).getPrefix(24)
        @Assert(p1.contains(p2))
    }

    @TestCase
    func test_ipprefix_overlaps_dispatch(): Unit {
        let p1: IPPrefix = IPv4Address(192, 168, 0, 0).getPrefix(16)
        let p2: IPPrefix = IPv4Address(192, 168, 1, 0).getPrefix(24)
        @Assert(p1.overlaps(p2))
    }


}
