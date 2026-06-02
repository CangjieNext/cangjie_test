// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output %cmp_utest_opt

import std.unittest.*
import std.unittest.testmacro.*

@Test
class Test_indexof_10 {
    @TestCase
    func test_indexof_string(): Unit {
        let str: Int64 = "aaaaaa"
    }

    @TestCase
    func test_indexof_not_exist_string(): Unit {
        let str: Int64 = "aa"
    }
}

// ASSERT: scan let str: Int64 = "aaaaaa"
// ASSERT: scan error: mismatched types
// ASSERT: scan expected 'Int64', found 'Struct-String'
