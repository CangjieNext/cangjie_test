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
// ASSERT: regex (.*FAIL.*) CASE: case01
// ASSERT: regex (.*FAIL.*) CASE: case02
// ASSERT: regex-not (.*FAIL.*) CASE: case03

import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*

func getRes(a: HashSet<String>, b: HashSet<String>, c: HashSet<String>): Array<HashSet<String>> {
    var arr: Array<HashSet<String>> = [a, b, c]
    return arr
}

@Test
class TestA {
    @TestCase
    public func case01(): Unit {
        var set1: HashSet<String> = HashSet<String>(["abc", "123", "!@#"])
        var set2: HashSet<String> = HashSet<String>(["abcd", "1234", "!@#$"])
        var set3: HashSet<String> = HashSet<String>(["abcde", "12345", "!@#$%"])
        var set4: HashSet<String> = HashSet<String>(["abcde", "12345", "!@#$%^"])

        var expect: Array<HashSet<String>> = [set1, set2, set3]
        var actual: Array<HashSet<String>> = [set1, set2, set4]

        expectEqual("expect", "actual", expect, actual)
    }

    @TestCase
    public func case02(): Unit {
        var set1: HashSet<String> = HashSet<String>(["abc", "123", "!@#"])
        var set2: HashSet<String> = HashSet<String>(["abcd", "1234", "!@#$"])
        var set3: HashSet<String> = HashSet<String>(["abcde", "12345", "!@#$%"])
        var set4: HashSet<String> = HashSet<String>(["abcde", "12345", "!@#$%^"])

        var expect: Array<HashSet<String>> = [set1, set2, set3]
        expectEqual("expect", "actual", expect, getRes(set1, set2, set4))
    }

    @TestCase
    public func case03(): Unit {
        var set1: HashSet<String> = HashSet<String>(["abc", "123", "!@#"])
        var set2: HashSet<String> = HashSet<String>(["abcd", "1234", "!@#$"])
        var set3: HashSet<String> = HashSet<String>(["abcde", "12345", "!@#$%"])
        var set4: HashSet<String> = HashSet<String>(["abcde", "12345", "!@#$%^"])

        var expect: Array<HashSet<String>> = [set1, set2, set3]
        expectEqual("expect", "actual", expect, getRes(set1, set2, set3))
    }
}
