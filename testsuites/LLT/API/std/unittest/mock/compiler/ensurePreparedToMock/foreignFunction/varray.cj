/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: test_varray.c

// EXEC: %clang %clang_shared_opt test_varray.c -o libtest_varray.%dylib_suffix
// EXEC: %compiler %cmp_opt -L./ -ltest_varray -Woff=all %f -o %output %cmp_utest_opt --mock=on 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

foreign func double_varray(x: VArray<Int64, $3>): Int64

var x: VArray<Int, $3> = [1, 2, 3]

@Test
func test_varray1() {
    unsafe {
        @On(x = _).doesNothing()
        double_varray(inout x)
        @Assert(x[0], 1)
    }
}

@Test
func test_varray2() {
    var x: VArray<Int, $3> = [1, 2, 3]
    unsafe {
        double_varray(inout x)
        @Assert(x[0], 2)
    }
}

@Test
func test_varray3() {
    var x: VArray<Int64, $3> = [1, 2, 3]
    unsafe {
        @Assert(double_varray(inout x), 6)
    }
    @Assert([x[0], x[1], x[2]] == [2, 4, 6])
}

// FIXME
// Problem is related to mock framework with `inout` modifier
// @Test
// func test_varray4() {
//     var a: VArray<Int64, $3> = [1, 2, 3]
//     unsafe {
//         @On(double_varray(_)).returns(42)
//         @Assert(double_varray(inout a), 42)
//     }
//     @Assert([a[0], a[1], a[2]] == [1, 2, 3])
// }
