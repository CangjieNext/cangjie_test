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
// ASSERT: scan CASE: caseA01
// ASSERT: scan CASE: caseB01
// ASSERT: regex .*FAILED.*: 1

import std.argopt.*
import std.unittest.*
import std.unittest.testmacro.*

func getArr(a: Rune, b: Rune, c: Rune): Array<Rune> {
    var aNew: Rune = r'a'
    var bNew: Rune = r'b'
    var cNew: Rune = r'c'
    var arr: Array<Rune> = [aNew, bNew, cNew]
    return arr
}

@Test
class TestA {
    @TestCase
    public func caseA01(): Unit {
        var args1: Array<Rune> = [r'a', r'b', r'c']
        @Expect(getArr(r'a', r'b', r'c'), args1)
    }
}

@Test
class TestB {
    @TestCase
    private func caseB01(): Unit {
        var args1: Array<Rune> = [r'd', r'e', r'f']
        @Expect(getArr(r'd', r'e', r'f'), args1)
    }
}
