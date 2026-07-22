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
public class IPv6AddressApiTest {
    @TestCase
    func test_localhost(): Unit {
        let ip = IPv6Address.localhost
        @Expect(ip.isLoopback())
        @Expect(!ip.isUnspecified())
        @Expect(!ip.isMulticast())
        @Expect(!ip.isLinkLocal())
        @Expect(!ip.isGlobalUnicast())
    }

    @TestCase
    func test_unspecified(): Unit {
        let ip = IPv6Address.unspecified
        @Expect(ip.isUnspecified())
        @Expect(!ip.isLoopback())
        @Expect(!ip.isGlobalUnicast())
    }

    @TestCase
    func test_constructor_octets(): Unit {
        let octets = Array<Byte>(16, repeat: 0)
        octets[0] = 0x20
        octets[1] = 0x01
        octets[15] = 0x01
        let ip = IPv6Address(octets)
        @Expect(ip.isGlobalUnicast())
        @Expect(!ip.isLoopback())
    }

    @TestCase
    func test_constructor_octets_too_small(): Unit {
        var caught = false
        try {
            let small = Array<Byte>(8, repeat: 0)
            let _ = IPv6Address(small)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    @TestCase
    func test_constructor_8x_u16(): Unit {
        let ip = IPv6Address(0x2001u16, 0x0db8, 0, 0, 0, 0, 0, 1)
        @Expect(ip.isGlobalUnicast())
        @Expect(!ip.isLoopback())
        @Expect(!ip.isMulticast())
    }

    @TestCase
    func test_multicast(): Unit {
        let ip = IPv6Address(0xff02u16, 0, 0, 0, 0, 0, 0, 1)
        @Expect(ip.isMulticast())
        @Expect(!ip.isGlobalUnicast())
    }

    @TestCase
    func test_link_local(): Unit {
        let ip = IPv6Address(0xfe80u16, 0, 0, 0, 0, 0, 0, 1)
        @Expect(ip.isLinkLocal())
        @Expect(!ip.isGlobalUnicast())
    }

    @TestCase
    func test_private(): Unit {
        let ip = IPv6Address(0xfc00u16, 0, 0, 0, 0, 0, 0, 1)
        @Expect(ip.isPrivate())
    }

    @TestCase
    func test_teredo(): Unit {
        let ip = IPv6Address(0x2001u16, 0, 0, 0, 0, 0, 0, 1)
        @Expect(ip.isTeredo())
    }

    @TestCase
    func test_ipv4_mapped(): Unit {
        let ip = IPv6Address(0u16, 0, 0, 0, 0, 0xffff, 0x1234, 0x5678)
        @Expect(ip.isIPv4Mapped())
        let v4opt = ip.toIPv4Mapped()
        match (v4opt) {
            case Some(v4) =>
                @Expect(v4.toString(), "18.52.86.120")
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_toIPv4_mapped(): Unit {
        let ip = IPv6Address(0u16, 0, 0, 0, 0, 0xffff, 0x1234, 0x5678)
        let v4opt = ip.toIPv4()
        match (v4opt) {
            case Some(v4) =>
                @Expect(v4.toString(), "18.52.86.120")
            case None =>
                @Assert(false)
        }
    }

    @TestCase
    func test_toIPv4_none(): Unit {
        let ip = IPv6Address(0x2001u16, 0x0db8, 0, 0, 0, 0, 0, 1)
        @Expect(ip.toIPv4().isNone())
    }

    @TestCase
    func test_equality(): Unit {
        let a = IPv6Address(0x2001u16, 0x0db8, 0, 0, 0, 0, 0, 1)
        let b = IPv6Address(0x2001u16, 0x0db8, 0, 0, 0, 0, 0, 1)
        let c = IPv6Address(0x2001u16, 0x0db8, 0, 0, 0, 0, 0, 2)
        @Expect(a == b)
        @Expect(a != c)
    }

    @TestCase
    func test_scopeId(): Unit {
        let ip = IPv6Address(0xfe80u16, 0, 0, 0, 0, 0, 0, 1, scopeId: 42)
        match (ip.scopeId) {
            case Some(id) =>
                @Expect(id, 42)
            case None =>
                @Assert(false)
        }
        let ip2 = ip.scope(None)
        @Expect(ip2.scopeId.isNone())
    }

    @TestCase
    func test_comparison(): Unit {
        let a = IPv6Address(0u16, 0, 0, 0, 0, 0, 0, 1)
        let b = IPv6Address(0u16, 0, 0, 0, 0, 0, 0, 2)
        @Expect(a <= b)
        @Expect(!(b <= a))
    }

    @TestCase
    func test_writeBigEndian(): Unit {
        let ip = IPv6Address.localhost
        let buf = Array<Byte>(16, repeat: 0)
        let n = ip.writeBigEndian(buf)
        @Expect(n, 16)
        @Expect(buf[15], 1)
    }

    @TestCase
    func test_writeBigEndian_too_small(): Unit {
        var caught = false
        try {
            let ip = IPv6Address.localhost
            let buf = Array<Byte>(8, repeat: 0)
            let _ = ip.writeBigEndian(buf)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    @TestCase
    func test_readBigEndian(): Unit {
        let buf = Array<Byte>(16, repeat: 0)
        buf[0] = 0x20
        buf[1] = 0x01
        buf[15] = 0x01
        let ip = IPv6Address.readBigEndian(buf)
        @Expect(ip.isGlobalUnicast())
    }

    @TestCase
    func test_readBigEndian_too_small(): Unit {
        var caught = false
        try {
            let buf = Array<Byte>(8, repeat: 0)
            let _ = IPv6Address.readBigEndian(buf)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    @TestCase
    func test_toString_localhost(): Unit {
        @Expect(IPv6Address.localhost.toString(), "::1")
    }

    @TestCase
    func test_toString_unspecified(): Unit {
        @Expect(IPv6Address.unspecified.toString(), "::")
    }

    @TestCase
    func test_toString_full(): Unit {
        let ip = IPv6Address(0x2001u16, 0x0db8, 0x1234, 0x5678, 0x9abc, 0xdef0, 0x1234, 0x5678)
        @Expect(ip.toString(), "2001:db8:1234:5678:9abc:def0:1234:5678")
    }

    @TestCase
    func test_getPrefix(): Unit {
        let ip = IPv6Address(0x2001u16, 0x0db8, 0, 0, 0, 0, 0, 0)
        let prefix = ip.getPrefix(64)
        @Expect(prefix.prefixLength, 64)
    }
}
