/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.convert.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestIPPrefix {
    @TestCase
    func testOverlaps(): Unit {
    }
}

@Test
class TestIPv4Prefix {
    @TestCase
    func testBroadcast(): Unit {
        let net = IPPrefix.parse("172.16.0.0/22")
        @Expect(net.broadcast().toString(), "172.16.3.255")
    }
    @TestCase
    func testNetwork(): Unit {
        let net = IPPrefix.parse("172.16.123.123/16")
        @Expect(net.network().toString(), "172.16.0.0")
    }
    @TestCase
    func testHostmask(): Unit {
        let net = IPPrefix.parse("10.1.0.0/20")
        @Expect(net.hostmask().toString(), "0.0.15.255")
    }
    @TestCase
    func testNetmask(): Unit {
        let net = IPPrefix.parse("10.1.0.0/20")
        @Expect(net.netmask().toString(), "255.255.240.0")
    }
    let netstrs = [
        ("0.0.0.0/0", "1.2.0.0/16", true),
        ("1.2.0.0/16", "0.0.0.0/0", true),
        ("1.2.0.0/16", "1.2.0.0/16", true),
        ("1.2.0.0/16", "1.2.3.0/24", true),
        ("1.2.3.0/24", "1.2.0.0/16", true),
        ("1.2.0.0/16", "1.2.3.0/32", true),
        ("1.2.3.0/32", "1.2.0.0/16", true),
        ("192.168.0.0/23", "192.160.0.0/23", false),
        ("10.0.0.0/16", "10.1.0.0/16", false)
    ]
    @TestCase[netstr in netstrs]
    func testOverlaps(netstr: (String, String, Bool)): Unit {
        let pfx1 = IPPrefix.parse(netstr[0])
        let pfx2 = IPPrefix.parse(netstr[1])
        @Expect(pfx1.overlaps(pfx2), netstr[2])
    }

    let ipv4Maskeds = [
        ("192.168.12.34/16", "192.168.0.0/16"),
        ("172.16.123.123/16", "172.16.0.0/16")
    ]
    @TestCase[netstr in ipv4Maskeds]
    func testMasked(netstr: (String, String)): Unit {
        let pfx1 = IPPrefix.parse(netstr[0])
        let pfx2 = IPPrefix.parse(netstr[1])
        @Expect(pfx1.masked(), pfx2)
    }
}

@Test
class TestIPv6Prefix {
    @TestCase
    func testBroadcast(): Unit {
        let net = IPPrefix.parse("fd00:1234:5678::/24")
        @Expect(net.broadcast().toString(), "fd00:12ff:ffff:ffff:ffff:ffff:ffff:ffff")
    }
    @TestCase
    func testNetwork(): Unit {
        let net = IPPrefix.parse("fd00:1234:5678::/24")
        @Expect(net.network().toString(), "fd00:1200::")
    }
    @TestCase
    func testHostmask(): Unit {
        let net = IPPrefix.parse("fd00::/24")
        @Expect(net.hostmask().toString(), "0:ff:ffff:ffff:ffff:ffff:ffff:ffff")
    }
    @TestCase
    func testNetmask(): Unit {
        let net = IPPrefix.parse("fd00::/24")
        @Expect(net.netmask().toString(), "ffff:ff00::")
    }
    let netstrs = [
        ("5::1/128", "5::0/8", true),
        ("5::0/8", "2::2/128", true),
        ("1::1/128", "1.2.0.0/16", false),
        ("0100::0/8", "::1/128", false)
    ]
    @TestCase[netstr in netstrs]
    func testOverlaps(netstr: (String, String, Bool)): Unit {
        let pfx1 = IPPrefix.parse(netstr[0])
        let pfx2 = IPPrefix.parse(netstr[1])
        @Expect(pfx1.overlaps(pfx2), netstr[2])
    }
    let ipv6Maskeds = [
        ("fd00::1:2:3:4/16", "fd00::/16"),
        ("fd00:1234:5678::/24", "fd00:1200::/24")
    ]
    @TestCase[netstr in ipv6Maskeds]
    func testMasked(netstr: (String, String)): Unit {
        let pfx1 = IPPrefix.parse(netstr[0])
        let pfx2 = IPPrefix.parse(netstr[1])
        @Expect(pfx1.masked(), pfx2)
    }
}
