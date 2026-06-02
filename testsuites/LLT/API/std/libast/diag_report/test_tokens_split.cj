// EXEC: %compiler %cmp_opt  -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.ast.*

@Test
class Test_tokens_split {
    @TestCase
    func test_case_01(): Unit {
        let tokens1 = quote(1 + 2 + 3)
        let tokens2 = quote(4 + 5 + 6)
        let tokens = tokens1 + tokens2
        @Expect("${tokens[0..5]}", "1 + 2 + 3")
        @Expect("${tokens[0..6]}", "1 + 2 + 3 4")
        @Expect("${tokens[5..10]}", "4 + 5 + 6")
        @Expect("${tokens[4..10]}", "3 4 + 5 + 6")
    }

    @TestCase
    func test_case_02(): Unit {
        let tokens1 = quote(1 + 2 + 3)
        let tokens2 = quote(4 + 5 + 6)
        let tokens3 = quote(7 + 8 + 9)
        let tokens4 = quote(10 + 11 + 12)
        let tokens = tokens1 + (tokens2 + tokens3) + tokens4
        @Expect("${tokens[4..16]}", "3 4 + 5 + 6 7 + 8 + 9 10")
        @Expect("${tokens[5..15]}", "4 + 5 + 6 7 + 8 + 9")
        @Expect("${tokens[9..16]}", "6 7 + 8 + 9 10")
        @Expect("${tokens[10..15]}", "7 + 8 + 9")
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
