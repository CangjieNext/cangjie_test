/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.argopt.*
import std.unittest.*
import std.unittest.testmacro.*

func getArr(): Array<Int16> {
    var arr: Array<Int16> = [1i16, 2i16, 3i16]
    return arr
}

@Test
class TestA {
    @TestCase
    func case01(): Unit {
        var args1: Array<Int16> = [1i16, 2i16, 3i16]
        @Expect(getArr(), args1)
    }
}

@Test
func case02(): Unit {
    @TestCase
    func case02(): Unit {
        var args1: Array<Int16> = [4i16, 5i16, 6i16]
        @Expect(getArr(), args1)
    }
}
