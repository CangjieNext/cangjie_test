/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: regex (.*FAIL.*) CASE: caseA01
// ASSERT: regex-not (.*FAIL.*) CASE: caseA02
// ASSERT: regex-not (.*FAIL.*) CASE: caseA03

import std.unittest.*
import std.unittest.testmacro.*

func getRes(a: String, b: String): String {
    var c: String = a + b
    return c
}

@Test
class TestA {
    @TestCase
    public func caseA01(): Unit {
        var expect: String = "HelloWorld"
        var actual: String = "Bye"
        expectEqual("abc", "abc", expect, actual)
    }

    @TestCase
    public func caseA02(): Unit {
        var expect: String = "CangJie"
        expectEqual("123", "123", expect, getRes("Cang", "Jie"))
    }

    @TestCase
    public func caseA03(): Unit {
        var expect: String = "CangJie, Hello"
        expectEqual("same", "same", expect, getRes("CangJie", ", Hello"))
    }
}
