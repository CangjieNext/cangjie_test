/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC-1: %run %run_opt %n.%suffix %run_utest_opt %run_args
// Assert: scan Expect Failed: `(v1 == None)`
// Assert: scan left: None
// Assert: scan Assert Failed: `(v1 == None)`
// Assert: scan left: None

func someString(): ?String {
    "1"
}

func noneString(): ?String {
    None
}

@Test
class Test_Option {
    @TestCase
    func test_option(): Unit {
        let v1 = someString()
        let v2 = noneString()
        @Expect(v1, "1")
        @Expect(v2, None)
        @Assert(v1, "1")
        @Assert(v2, None)
    }

    @TestCase
    func test_option_fail(): Unit {
        let v1 = noneString()
        @Expect(v1, "None")
        @Assert(v1, "None")
    }
}
