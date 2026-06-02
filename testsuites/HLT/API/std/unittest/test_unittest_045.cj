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
// ASSERT: regex (.*FAIL.*) CASE: case01
// ASSERT: regex (.*FAIL.*) CASE: case02
// ASSERT: regex-not (.*FAIL.*) CASE: case03
// ASSERT: regex-not (.*FAIL.*) CASE: case04

import std.unittest.*
import std.unittest.testmacro.*

func foo<T>(x: Option<T>): Option<T> {
    return x
}

@Test
class TestA {
    @TestCase
    public func case01(): Unit {
        var expect: Option<Rune> = Some<Rune>(r'a')
        var actual: Option<Rune> = Some<Rune>(r'b')
        expectEqual("expect", "actual", expect, actual)
    }

    @TestCase
    public func case02(): Unit {
        var expect: Option<Rune> = Option<Rune>.None
        expectEqual("expect", "actual", expect, foo(Some<Rune>(r'b')))
    }

    @TestCase
    public func case03(): Unit {
        var expect: Option<Rune> = Some<Rune>(r'a')
        expectEqual("expect", "actual", expect, foo(Some<Rune>(r'a')))
    }

    @TestCase
    public func case04(): Unit {
        var expect: Option<Rune> = Option<Rune>.None
        expectEqual("expect", "actual", expect, foo(Option<Rune>.None))
    }
}
