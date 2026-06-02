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
public class Test_IPv4Address_Assertion {
    @TestCase
    func case_assertEqual(): Unit {
        @Expect(IPv4Address(0, 0, 0, 0) == IPv4Address(0, 0, 0, 0))
        @Expect(IPv4Address(255, 255, 255, 255) == IPv4Address(255, 255, 255, 255))
    }

    @TestCase
    func case_assertUnEqual(): Unit {
        @Expect(IPv4Address(0, 0, 0, 0) != IPv4Address(255, 255, 255, 255))
        @Expect(IPv4Address(255, 255, 255, 255) != IPv4Address(0, 0, 0, 0))
        @Expect(IPv4Address(255, 255, 255, 255) != IPv4Address(255, 255, 255, 254))
    }

    @TestCase
    func case_assertLessEqual(): Unit {
        @Expect(IPv4Address(0, 0, 0, 0) <= IPv4Address(0, 0, 0, 0))
        @Expect(IPv4Address(255, 255, 255, 255) <= IPv4Address(255, 255, 255, 255))
        @Expect(IPv4Address(0, 0, 0, 0) <= IPv4Address(0, 0, 0, 1))
        @Expect(IPv4Address(255, 255, 255, 254) <= IPv4Address(255, 255, 255, 255))
        @Expect(IPv4Address(0, 0, 0, 1) <= IPv4Address(0, 0, 0, 0), false)
        @Expect(IPv4Address(255, 255, 255, 255) <= IPv4Address(255, 255, 255, 254), false)
        @Expect(IPv4Address(0, 0, 0, 0) <= IPv4Address(255, 255, 255, 255))
    }
}
