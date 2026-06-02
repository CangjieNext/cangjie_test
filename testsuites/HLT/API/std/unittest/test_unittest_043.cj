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

struct Data {
    public var opt: Option<Int32> = Option<Int32>.None
    public init(x: Option<Int32>) {
        opt = x
    }
    public func f(x: Option<Int32>): Option<Int32> {
        return x
    }
}

func getRes(data: Data): Option<Int32> {
    return data.opt
}

@Test
class TestA {
    @TestCase
    public func case01(): Unit {
        var expect: Option<Int32> = Data(Option<Int32>.Some(2)).opt
        var actual: Option<Int32> = Data(Option<Int32>.Some(2)).f(Option<Int32>.Some(12))
        expectEqual("expect", "actual", expect, actual)
    }

    @TestCase
    public func case02(): Unit {
        var expect: Option<Int32> = Data(Option<Int32>.Some(2)).opt
        expectEqual("expect", "actual", expect, getRes(Data(Option<Int32>.Some(4))))
    }

    @TestCase
    public func case03(): Unit {
        var expect: Option<Int32> = Data(Option<Int32>.Some(2)).opt
        expectEqual("expect", "actual", expect, getRes(Data(Option<Int32>.Some(2))))
    }

    @TestCase
    public func case04(): Unit {
        var expect: Option<Int32> = Option<Int32>.None
        expectEqual("expect", "actual", expect, getRes(Data(Option<Int32>.None)))
    }
}
