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
public class Test_IPv6Address_Init {
    @TestCase[scopeId in [ 0u32, 255u32, UInt32.Max ] 
]
    func case_init_01(scopeId: UInt32) {
        IPv6Address(Array<Byte>(16, repeat: 0u8))
        IPv6Address(Array<Byte>(16, repeat: 0u8), scopeId: scopeId)
        IPv6Address(Array<Byte>(16, repeat: 255u8))
        IPv6Address(Array<Byte>(16, repeat: 255u8), scopeId: scopeId)
        IPv6Address(0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16)
        IPv6Address(0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16, scopeId: scopeId)
        IPv6Address(65535u16, 65535u16, 65535u16, 65535u16, 65535u16, 65535u16, 65535u16, 65535u16)
        IPv6Address(65535u16, 65535u16, 65535u16, 65535u16, 65535u16, 65535u16, 65535u16, 65535u16, scopeId: scopeId)
    }

    @TestCase
    func case_init_02() {
        @AssertThrows[IllegalArgumentException](IPv6Address(Array<Byte>()))
        @AssertThrows[IllegalArgumentException](IPv6Address(Array<Byte>(1, repeat: 0u8)))
        @Expect(IPv6Address(Array<Byte>(17, repeat: 0u8)) == IPv6Address(Array<Byte>(16, repeat: 0u8)))
    }

    @TestCase
    func case_readBigEndian_01() {
        @Expect(IPv6Address(Array<Byte>(16, repeat: 0u8)) == IPv6Address.readBigEndian(Array<Byte>(17, repeat: 0u8)))
        @Expect(IPv6Address(Array<Byte>(17, repeat: 0u8)) == IPv6Address.readBigEndian(Array<Byte>(17, repeat: 0u8)))
        @Expect(IPv6Address(Array<Byte>(16, repeat: 255u8)) == IPv6Address.readBigEndian(Array<Byte>(17, repeat: 255u8)))
    }

    @TestCase
    func case_readBigEndian_02() {
        @AssertThrows[IllegalArgumentException](IPv6Address.readBigEndian(Array<Byte>(15, repeat: 0u8)))
        @AssertThrows[IllegalArgumentException](IPv6Address.readBigEndian(Array<Byte>()))
    }
}
