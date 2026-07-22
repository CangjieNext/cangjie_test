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
public class IPv4AddressApiTest {
    @TestCase
    func test_localhost(): Unit {
        let ip = IPv4Address.localhost
        @Expect(ip.isLoopback())
        @Expect(!ip.isUnspecified())
        @Expect(!ip.isBroadcast())
        @Expect(!ip.isMulticast())
        @Expect(!ip.isPrivate())
        @Expect(!ip.isLinkLocal())
        @Expect(!ip.isGlobalUnicast())
    }

    @TestCase
    func test_unspecified(): Unit {
        let ip = IPv4Address.unspecified
        @Expect(ip.isUnspecified())
        @Expect(!ip.isLoopback())
        @Expect(!ip.isGlobalUnicast())
    }

    @TestCase
    func test_broadcast(): Unit {
        let ip = IPv4Address.broadcast
        @Expect(ip.isBroadcast())
        @Expect(!ip.isGlobalUnicast())
    }

    @TestCase
    func test_constructor_bytes(): Unit {
        let ip = IPv4Address(192, 168, 1, 1)
        @Expect(ip.isPrivate())
        @Expect(!ip.isLoopback())
        @Expect(!ip.isGlobalUnicast())
    }

    @TestCase
    func test_constructor_bits(): Unit {
        let ip = IPv4Address(0x0A000001u32)
        @Expect(ip.isPrivate())
        @Expect(ip.toString(), "10.0.0.1")
    }

    @TestCase
    func test_toBits(): Unit {
        let ip = IPv4Address(192, 168, 1, 1)
        @Expect(ip.toBits(), 0xC0A80101u32)
    }

    @TestCase
    func test_isPrivate_10(): Unit {
        @Expect(IPv4Address(10, 0, 0, 1).isPrivate())
    }

    @TestCase
    func test_isPrivate_172(): Unit {
        @Expect(IPv4Address(172, 16, 0, 1).isPrivate())
        @Expect(IPv4Address(172, 31, 0, 1).isPrivate())
        @Expect(!IPv4Address(172, 32, 0, 1).isPrivate())
    }

    @TestCase
    func test_isPrivate_192(): Unit {
        @Expect(IPv4Address(192, 168, 0, 1).isPrivate())
    }

    @TestCase
    func test_isLinkLocal(): Unit {
        @Expect(IPv4Address(169, 254, 0, 1).isLinkLocal())
        @Expect(!IPv4Address(169, 255, 0, 1).isLinkLocal())
    }

    @TestCase
    func test_isMulticast(): Unit {
        @Expect(IPv4Address(224, 0, 0, 1).isMulticast())
        @Expect(IPv4Address(230, 0, 0, 1).isMulticast())
        @Expect(!IPv4Address(128, 0, 0, 1).isMulticast())
    }

    @TestCase
    func test_isGlobalUnicast(): Unit {
        let ip = IPv4Address(8, 8, 8, 8)
        @Expect(ip.isGlobalUnicast())
        @Expect(!ip.isPrivate())
        @Expect(!ip.isLoopback())
    }

    @TestCase
    func test_equality(): Unit {
        let a = IPv4Address(192, 168, 1, 1)
        let b = IPv4Address(192, 168, 1, 1)
        let c = IPv4Address(192, 168, 1, 2)
        @Expect(a == b)
        @Expect(a != c)
    }

    @TestCase
    func test_comparison(): Unit {
        let a = IPv4Address(10, 0, 0, 1)
        let b = IPv4Address(10, 0, 0, 2)
        @Expect(a <= b)
        @Expect(!(b <= a))
    }

    @TestCase
    func test_writeBigEndian(): Unit {
        let ip = IPv4Address(192, 168, 1, 1)
        let buf = Array<Byte>(4, repeat: 0)
        let n = ip.writeBigEndian(buf)
        @Expect(n, 4)
        @Expect(buf[0], 192)
        @Expect(buf[1], 168)
        @Expect(buf[2], 1)
        @Expect(buf[3], 1)
    }

    @TestCase
    func test_writeBigEndian_too_small(): Unit {
        var caught = false
        try {
            let ip = IPv4Address.localhost
            let buf = Array<Byte>(2, repeat: 0)
            let _ = ip.writeBigEndian(buf)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    @TestCase
    func test_readBigEndian(): Unit {
        let buf = Array<Byte>(4, repeat: 0)
        buf[0] = 10
        buf[1] = 0
        buf[2] = 0
        buf[3] = 1
        let ip = IPv4Address.readBigEndian(buf)
        @Expect(ip.toString(), "10.0.0.1")
    }

    @TestCase
    func test_readBigEndian_too_small(): Unit {
        var caught = false
        try {
            let buf = Array<Byte>(2, repeat: 0)
            let _ = IPv4Address.readBigEndian(buf)
        } catch (e: IllegalArgumentException) {
            caught = true
        }
        @Expect(caught)
    }

    @TestCase
    func test_toString(): Unit {
        @Expect(IPv4Address(192, 168, 1, 1).toString(), "192.168.1.1")
    }

    @TestCase
    func test_getPrefix(): Unit {
        let ip = IPv4Address(192, 168, 1, 0)
        let prefix = ip.getPrefix(24)
        @Expect(prefix.prefixLength, 24)
    }
}
