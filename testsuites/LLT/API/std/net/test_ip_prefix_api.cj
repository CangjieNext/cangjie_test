/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.net.*

@Test
public class IPPrefixApiTest {
    @TestCase
    func test_parse_ipv4(): Unit {
        let prefix = IPPrefix.parse("192.168.1.0/24")
        @Expect(prefix.prefixLength, 24)
        @Expect(prefix.address.toString(), "192.168.1.0")
    }

    @TestCase
    func test_parse_ipv6(): Unit {
        let prefix = IPPrefix.parse("2001:db8::/32")
        @Expect(prefix.prefixLength, 32)
        @Expect(prefix.address.toString(), "2001:db8::")
    }

    @TestCase
    func test_parse_invalid(): Unit {
        var caught = false
        try {
            let _ = IPPrefix.parse("not-an-ip/24")
        } catch (e: IllegalFormatException) {
            caught = true
        }
        @Expect(caught)
    }

    @TestCase
    func test_tryParse_success(): Unit {
        let opt = IPPrefix.tryParse("10.0.0.0/8")
        match (opt) {
            case Some(prefix) =>
                @Expect(prefix.prefixLength, 8)
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_tryParse_failure(): Unit {
        let opt = IPPrefix.tryParse("invalid/")
        @Expect(opt.isNone())
    }

    @TestCase
    func test_tryParse_no_slash(): Unit {
        let opt = IPPrefix.tryParse("192.168.1.0")
        @Expect(opt.isNone())
    }

    @TestCase
    func test_ipv4_netmask(): Unit {
        let prefix = IPPrefix.parse("192.168.1.0/24")
        let mask = prefix.netmask()
        @Expect(mask.toString(), "255.255.255.0")
    }

    @TestCase
    func test_ipv4_hostmask(): Unit {
        let prefix = IPPrefix.parse("192.168.1.0/24")
        let mask = prefix.hostmask()
        @Expect(mask.toString(), "0.0.0.255")
    }

    @TestCase
    func test_ipv4_network(): Unit {
        let prefix = IPPrefix.parse("192.168.1.130/24")
        let net = prefix.network()
        @Expect(net.toString(), "192.168.1.0")
    }

    @TestCase
    func test_ipv4_broadcast(): Unit {
        let prefix = IPPrefix.parse("192.168.1.0/24")
        let bcast = prefix.broadcast()
        @Expect(bcast.toString(), "192.168.1.255")
    }

    @TestCase
    func test_ipv4_masked(): Unit {
        let prefix = IPPrefix.parse("192.168.1.130/24")
        let masked = prefix.masked()
        @Expect(masked.toString(), "192.168.1.0/24")
    }

    @TestCase
    func test_ipv4_contains_address(): Unit {
        let prefix = IPPrefix.parse("192.168.1.0/24")
        let ipIn = IPAddress.parse("192.168.1.50")
        let ipOut = IPAddress.parse("192.168.2.50")
        @Expect(prefix.contains(ipIn))
        @Expect(!prefix.contains(ipOut))
    }

    @TestCase
    func test_ipv4_contains_prefix(): Unit {
        let outer = IPPrefix.parse("192.168.0.0/16")
        let inner = IPPrefix.parse("192.168.1.0/24")
        @Expect(outer.contains(inner))
        @Expect(!inner.contains(outer))
    }

    @TestCase
    func test_ipv4_overlaps(): Unit {
        let a = IPPrefix.parse("192.168.1.0/24")
        let b = IPPrefix.parse("192.168.1.128/25")
        let c = IPPrefix.parse("192.168.2.0/24")
        @Expect(a.overlaps(b))
        @Expect(!a.overlaps(c))
    }

    @TestCase
    func test_ipv4_equality(): Unit {
        let a = IPPrefix.parse("192.168.1.0/24")
        let b = IPPrefix.parse("192.168.1.0/24")
        let c = IPPrefix.parse("192.168.1.0/25")
        @Expect(a == b)
        @Expect(a != c)
    }

    @TestCase
    func test_ipv4_toString(): Unit {
        let prefix = IPPrefix.parse("10.0.0.0/8")
        @Expect(prefix.toString(), "10.0.0.0/8")
    }

    @TestCase
    func test_ipv6_netmask(): Unit {
        let prefix = IPPrefix.parse("2001:db8::/64")
        let mask = prefix.netmask()
        @Expect(mask.toString(), "ffff:ffff:ffff:ffff::")
    }

    @TestCase
    func test_ipv6_hostmask(): Unit {
        let prefix = IPPrefix.parse("2001:db8::/64")
        let mask = prefix.hostmask()
        @Expect(mask.toString(), "::ffff:ffff:ffff:ffff")
    }

    @TestCase
    func test_ipv6_network(): Unit {
        let prefix = IPPrefix.parse("2001:db8:1234:5678::1/64")
        let net = prefix.network()
        @Expect(net.toString(), "2001:db8:1234:5678::")
    }

    @TestCase
    func test_ipv6_contains_address(): Unit {
        let prefix = IPPrefix.parse("2001:db8::/32")
        let ipIn = IPAddress.parse("2001:db8:1234::1")
        let ipOut = IPAddress.parse("2001:db9::1")
        @Expect(prefix.contains(ipIn))
        @Expect(!prefix.contains(ipOut))
    }

    @TestCase
    func test_ipv6_overlaps(): Unit {
        let a = IPPrefix.parse("2001:db8::/32")
        let b = IPPrefix.parse("2001:db8:8000::/33")
        let c = IPPrefix.parse("2001:db9::/32")
        @Expect(a.overlaps(b))
        @Expect(!a.overlaps(c))
    }

    @TestCase
    func test_ipv6_equality(): Unit {
        let a = IPPrefix.parse("2001:db8::/32")
        let b = IPPrefix.parse("2001:db8::/32")
        let c = IPPrefix.parse("2001:db8::/64")
        @Expect(a == b)
        @Expect(a != c)
    }

    @TestCase
    func test_ipv6_toString(): Unit {
        let prefix = IPPrefix.parse("2001:db8::/32")
        @Expect(prefix.toString(), "2001:db8::/32")
    }

    @TestCase
    func test_ipv4_prefix_too_large(): Unit {
        var caught = false
        try {
            let ip = IPAddress.parse("192.168.1.0")
            let _ = ip.getPrefix(33)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    @TestCase
    func test_ipv6_prefix_too_large(): Unit {
        var caught = false
        try {
            let ip = IPAddress.parse("2001:db8::1")
            let _ = ip.getPrefix(129)
        } catch (e: IllegalFormatException) {
            caught = true
        }
        @Expect(caught)
    }

    @TestCase
    func test_cross_type_contains(): Unit {
        let v4prefix = IPPrefix.parse("192.168.1.0/24")
        let v6ip = IPAddress.parse("::1")
        @Expect(!v4prefix.contains(v6ip))
    }

    @TestCase
    func test_cross_type_overlaps(): Unit {
        let v4prefix = IPPrefix.parse("192.168.1.0/24")
        let v6prefix = IPPrefix.parse("2001:db8::/32")
        @Expect(!v4prefix.overlaps(v6prefix))
    }

    @TestCase
    func test_cross_type_equality(): Unit {
        let v4prefix = IPPrefix.parse("192.168.1.0/24")
        let v6prefix = IPPrefix.parse("2001:db8::/32")
        @Expect(v4prefix != v6prefix)
    }

    @TestCase
    func test_ipv4_prefix_32(): Unit {
        let prefix = IPPrefix.parse("192.168.1.1/32")
        @Expect(prefix.netmask().toString(), "255.255.255.255")
        @Expect(prefix.hostmask().toString(), "0.0.0.0")
        @Expect(prefix.network().toString(), "192.168.1.1")
        @Expect(prefix.broadcast().toString(), "192.168.1.1")
    }

    @TestCase
    func test_ipv4_prefix_0(): Unit {
        let prefix = IPPrefix.parse("0.0.0.0/0")
        @Expect(prefix.netmask().toString(), "0.0.0.0")
        @Expect(prefix.hostmask().toString(), "255.255.255.255")
    }

    @TestCase
    func test_ipv6_prefix_128(): Unit {
        let prefix = IPPrefix.parse("2001:db8::1/128")
        @Expect(prefix.network().toString(), "2001:db8::1")
        @Expect(prefix.broadcast().toString(), "2001:db8::1")
    }

    @TestCase
    func test_ipv6_masked(): Unit {
        let prefix = IPPrefix.parse("2001:db8:1234:5678::abcd/64")
        let masked = prefix.masked()
        @Expect(masked.toString(), "2001:db8:1234:5678::/64")
    }
}
