/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %cmp_utest_opt %f -o %output

import std.argopt.*
import std.unittest.*
import std.unittest.testmacro.*

func getArr(): Array<String> {
    var arr: Array<String> = ["aa", "bb", "cc"]
    return arr
}

@Test
open class TestA {
    @TestCase
    func case01(): Unit {
        var args1: Array<String> = ["-aa", "-bb", "-cc"]
        @Expect(getArr(), args1)
    }
}

@Test
class TestB {
    @TestCase
    func case02(): Unit {
        var args1: Array<String> = ["aa", "bb", "cc"]
        @Expect(getArr(), args1)
    }
}

// ASSERT: scan macro_evaluate_failed
