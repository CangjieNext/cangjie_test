/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.argopt.*
import std.unittest.*
import std.unittest.testmacro.*

func getArr(): Array<Int16> {
    var arr: Array<Int16> = [1, 2, 3]
    return arr
}

@Test
class TestA {
    @TestCase
    func case01(): Unit {
        var args1: Array<Int16> = [1, 2, 3]
        @Expect(getArr(), args1)
    }
}

@Test
func case02(): Unit {
    @TestCase
    func case02(): Unit {
        var args1: Array<Int16> = [4, 5, 6]
        @Expect(getArr(), args1)
    }
}
