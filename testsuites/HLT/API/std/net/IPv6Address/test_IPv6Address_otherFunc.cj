/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.net.*
import std.math.*

@Test
public class Test_IPv6Address_Funcs {
    @TestCase[scopeId in [ 0u32, 255u32, UInt32.Max ] 
]
    func case_scopeId_01(scopeId: UInt32) {
        let addr1 = IPv6Address(Array<Byte>(16, repeat: 0u8), scopeId: scopeId)
        @Expect(addr1.scopeId, scopeId)
        let addr2 = IPv6Address(Array<Byte>(16, repeat: 255u8), scopeId: scopeId)
        @Expect(addr2.scopeId, scopeId)
        let addr3 = IPv6Address(0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16, scopeId: scopeId)
        @Expect(addr3.scopeId, scopeId)
        let addr4 = IPv6Address(65535u16, 65535u16, 65535u16, 65535u16, 65535u16, 65535u16, 65535u16, 65535u16,
            scopeId: scopeId)
        @Expect(addr4.scopeId, scopeId)
    }

    @TestCase
    func case_getPrefix_01() {
        let addr1 = IPv6Address(Array<Byte>(16, repeat: 0u8), scopeId: 0)
        var pre1 = addr1.getPrefix(0)
        @Expect(pre1.toString(), "::%0/0")
        var pre2 = addr1.getPrefix(32)
        @Expect(pre2.toString(), "::%0/32")
        var pre3 = addr1.getPrefix(128)
        @Expect(pre3.toString(), "::%0/128")
        @AssertThrows[IllegalArgumentException](addr1.getPrefix(129))
    }

    @TestCase
    func case_hashCode_01() {
        let addr0 = IPv6Address(Array<Byte>(16, repeat: 0u8))
        let addr1 = IPv6Address(Array<Byte>(16, repeat: 0u8), scopeId: 0)
        @Expect(addr0.hashCode(), -3307087234192089307)
        @Expect(addr1.hashCode(), 4822060007189355447)
    }

    @TestCase
    func case_scope_01() {
        let addr0 = IPv6Address(Array<Byte>(16, repeat: 0u8))
        let addr1 = IPv6Address(Array<Byte>(16, repeat: 0u8), scopeId: 0)
        @Expect(addr0.scope(0) == addr1)
        @Expect(addr1.scope(0) == addr1)
        @Expect(addr1.scope(1) != addr1)
        @Expect(addr1.scope(None) == addr0)
        @Expect(addr0.scope(None) == addr0)
    }

    @TestCase
    func case_toIPv4_01(): Unit {
        @Expect((IPAddress.parse("::") as IPv6Address).getOrThrow().toIPv4(), IPAddress.parse("0.0.0.0") as IPv4Address)
        @Expect((IPAddress.parse("::1.2.3.4") as IPv6Address).getOrThrow().toIPv4(), IPAddress.parse("1.2.3.4") as IPv4Address)
        @Expect((IPAddress.parse("::255.255.255.255") as IPv6Address).getOrThrow().toIPv4(), IPAddress.parse("255.255.255.255") as IPv4Address)
        @Expect((IPAddress.parse("::ffff:0.0.0.0") as IPv6Address).getOrThrow().toIPv4(), IPAddress.parse("0.0.0.0") as IPv4Address)
        @Expect((IPAddress.parse("::ffff:255.255.255.255") as IPv6Address).getOrThrow().toIPv4(), IPAddress.parse("255.255.255.255") as IPv4Address)
    }

    @TestCase[str in [ 
 "2001::", 
 "::fff:1.2.3.4" 
 ] 
]
    func case_toIPv4_02(str: String): Unit {
        let addr0 = (IPAddress.parse(str) as IPv6Address).getOrThrow()
        @Expect(addr0.toIPv4(), None)
    }

    @TestCase[str in [ 
 "::ffff:1.2.3.4", 
 "::ffff:255.255.255.255" 
 ] 
]
    func case_toIPv4Mapped_01(str: String): Unit {
        let addr0 = (IPAddress.parse(str) as IPv6Address).getOrThrow()
        @Expect(addr0.toIPv4Mapped().getOrThrow().toIPv6Mapped(), addr0)
    }

    @TestCase[str in [ 
 "::", 
 "::1", 
 "::12", 
 "::fff:1.2.3.4", 
 "::efff:1.2.3.4" 
 ] 
]
    func case_toIPv4Mapped_02(str: String): Unit {
        let addr0 = (IPAddress.parse(str) as IPv6Address).getOrThrow()
        @Expect(addr0.toIPv4Mapped(), None)
    }

    @TestCase
    func case_writeBigEndian_01(): Unit {
        let arr = Array<Byte>(16, repeat: 1u8)
        let addr1 = IPv6Address(arr)
        let addr2 = IPv6Address(arr, scopeId: 0)
        var buf1 = Array<Byte>(100, repeat: 0u8)
        var buf2 = Array<Byte>(100, repeat: 0u8)
        @Expect(addr1.writeBigEndian(buf1), 16)
        @Expect(addr2.writeBigEndian(buf2), 16)
        @Expect(buf1[0..16], arr)
        @Expect(buf2[0..16], arr)
        @Expect(buf1[16], 0u8)
        @Expect(buf2[16], 0u8)
    }

    @TestCase
    func case_writeBigEndian_02(): Unit {
        let arr = Array<Byte>(16, repeat: 1u8)
        let addr1 = IPv6Address(arr)
        let addr2 = IPv6Address(arr, scopeId: 0)
        var buf1 = Array<Byte>(1, repeat: 0u8)
        var buf2 = Array<Byte>(15, repeat: 0u8)
        @AssertThrows[IllegalArgumentException](addr1.writeBigEndian(buf1))
        @AssertThrows[IllegalArgumentException](addr2.writeBigEndian(buf2))
    }

    @TestCase
    func case_toString_01(): Unit {
        let arr = Array<Byte>(16, repeat: 1u8)
        let addr1 = IPv6Address(arr)
        let addr2 = IPv6Address(arr, scopeId: 0)
        @Expect(addr1.toString(), "101:101:101:101:101:101:101:101")
        @Expect(addr2.toString(), "101:101:101:101:101:101:101:101%0")
        @Expect(addr2.scope(1).toString(), "101:101:101:101:101:101:101:101%1")
    }
}
