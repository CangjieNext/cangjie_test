/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: regex (.*FAIL.*) CASE: case01
// ASSERT: regex (.*FAIL.*) CASE: case02
// ASSERT: regex-not (.*FAIL.*) CASE: case03

import std.unittest.*
import std.unittest.testmacro.*

func getRes(a: String, b: String, c: String): Array<String> {
    var arr: Array<String> = [a, b, c]
    return arr
}

@Test
class TestA {
    @TestCase
    public func case01(): Unit {
        var expect: Array<String> = ["abc", "123", "!@#"]
        var actual: Array<String> = ["ab1", "a23", "!@#"]
        expectEqual("expect", "actual", expect, actual)
    }

    @TestCase
    public func case02(): Unit {
        var expect: Array<String> = ["abc", "123", "!@#"]
        expectEqual("expect", "actual", expect, getRes("abc", "1233", "!@#"))
    }

    @TestCase
    public func case03(): Unit {
        var expect: Array<String> = ["abc", "123", "!@#"]
        expectEqual("expect", "actual", expect, getRes("abc", "123", "!@#"))
    }
}

/* SCAN-IN
        Different elements (left - expect, right - actual):
            [0]: "abc" != "ab1"
            [1]: "123" != "a23"*/

/* SCAN-IN
        Different elements (left - expect, right - actual):
            [1]: "123" != "1233"*/
