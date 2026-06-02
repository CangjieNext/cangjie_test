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
public class Test_IPAddress_Assertion {
    let addr_cps = [
        ("0.0.0.0", "0.0.0.0"),
        ("::", "0:0:0:0:0:0:0:0"),
        ("::1", "0:0:0:0:0:0:0:1"),
        ("2001:0db8:85a3:0000:0000:8a2e:0370:7334", "2001:db8:85a3::8a2e:370:7334"),
        ("2001:db8:85a3:0:0:8a2e:370:7334", "2001:db8:85a3::8a2e:370:7334"),
        ("::ffff:192.0.2.128", "::ffff:c000:0280")
    ]

    @TestCase[addr_cp in addr_cps 
]
    func case_assertEqual(addr_cp: (String, String)): Unit {
        let (s1, s2) = addr_cp
        @Expect(IPAddress.parse(s1) == IPAddress.parse(s2))
    }

    @TestCase
    func case_assertUnEqual(): Unit {
        @Expect(IPAddress.parse("::") != IPAddress.parse("::1"))
        @Expect(IPAddress.parse("::") != IPAddress.parse("0.0.0.0"))
        @Expect(IPAddress.parse("::1") != IPAddress.parse("127.0.0.1"))
        @Expect(IPAddress.parse("2001:0db8:85a3:0000:0000:8a2e:0370:7334") != IPAddress.parse("201:0db8:85a3::8a2e:0370:7334"))
    }
}
