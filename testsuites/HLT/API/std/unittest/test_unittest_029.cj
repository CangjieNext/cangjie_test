/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: regex (.*FAIL.*) CASE: caseA02
// ASSERT: regex-not (.*FAIL.*) CASE: caseA01

import std.unittest.*
import std.unittest.testmacro.*

func getRes(a: Rune): Rune {
    return a
}

@Test
class TestA {
    @TestCase
    public func caseA01(): Unit {
        var expect: Rune = r'a'
        expectEqual("expect", "getRes()", expect, getRes(r'a'))
    }

    @TestCase
    public func caseA02(): Unit {
        var expect: Rune = r'a'
        var actual: Rune = r'b'
        expectEqual("actual", "actual", expect, actual)
    }
}
