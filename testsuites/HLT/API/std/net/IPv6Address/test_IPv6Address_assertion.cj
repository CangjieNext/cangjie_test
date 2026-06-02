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

@Test
public class Test_IPv6Address_Assertion {
    let addr_cps = [
        ("::", "0:0:0:0:0:0:0:0"),
        ("::1", "0:0:0:0:0:0:0:1"),
        ("2001:0db8:85a3:0000:0000:8a2e:0370:7334", "2001:db8:85a3::8a2e:370:7334"),
        ("2001:db8:85a3:0:0:8a2e:370:7334", "2001:db8:85a3::8a2e:370:7334"),
        ("::ffff:192.0.2.128", "::ffff:c000:0280")
    ]

    @TestCase[addr_cp in addr_cps 
]
    func case_assertEqual_01(addr_cp: (String, String)): Unit {
        let (s1, s2) = addr_cp
        @Expect(IPAddress.parse(s1) as IPv6Address == IPAddress.parse(s2) as IPv6Address)
    }

    @TestCase
    func case_assertEqual_02(): Unit {
        let arr = Array<Byte>(16, repeat: 0u8)
        @Expect(IPv6Address(arr, scopeId: 0) == IPv6Address(arr, scopeId: 0))
        let arr1 = Array<Byte>(16, repeat: 255u8)
        @Expect(IPv6Address(arr, scopeId: 0) == IPv6Address(arr1, scopeId: 0), false)
        @Expect(IPv6Address(arr, scopeId: 0) == IPv6Address(0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16, scopeId: 0))
    }

    @TestCase
    func case_assertUnEqual_01(): Unit {
        let arr = Array<Byte>(16, repeat: 0u8)
        @Expect(IPv6Address(arr, scopeId: 0) != IPv6Address(arr, scopeId: 1))
        let arr1 = Array<Byte>(16, repeat: 0u8)
        arr1[15] = 1
        @Expect(IPv6Address(arr, scopeId: 0) != IPv6Address(arr1, scopeId: 0))
    }

    @TestCase
    func case_assertLessEqual_01(): Unit {
        let arr = Array<Byte>(16, repeat: 0u8)
        @Expect(IPv6Address(arr, scopeId: 0) <= IPv6Address(arr, scopeId: 1))
        @Expect(IPv6Address(arr, scopeId: 1) <= IPv6Address(arr, scopeId: 0))
        let arr1 = Array<Byte>(16, repeat: 0u8)
        arr1[15] = 1
        @Expect(IPv6Address(arr, scopeId: 0) <= IPv6Address(arr1, scopeId: 0))
        @Expect(IPv6Address(arr1, scopeId: 0) <= IPv6Address(arr, scopeId: 0), false)
    }
}
