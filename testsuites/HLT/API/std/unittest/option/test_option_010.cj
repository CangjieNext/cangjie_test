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
// ASSERT: regex .*FAILED.*: 1
// ASSERT: scan TestCase_case02

import std.argopt.*
import std.unittest.*
import std.unittest.testmacro.*

func getArr(): Array<String> {
    var arr: Array<String> = ["aa", "bb", "cc"]
    return arr
}

@Test
class TestA {
    @TestCase
    func case01(): Unit {
        var args1: Array<String> = ["-aa", "-bb", "-cc"]
        @Expect(getArr(), args1)
    }
}

@Test
func case02(): Unit {
    @TestCase
    func case02(): Unit {
        var args1: Array<String> = ["aa", "bb", "cc"]
        @Expect(getArr(), args1)
    }
}
