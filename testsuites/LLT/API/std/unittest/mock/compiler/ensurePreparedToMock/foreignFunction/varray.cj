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

@Test
func test_varray() {
    var a: VArray<Int64, $3> = [1, 2, 3]
    unsafe {
        @Assert(double_varray(inout a), 6)
    }
    @Assert([a[0], a[1], a[2]] == [2, 4, 6])
}

// FIXME: Support inout arguments in @On macro
// @Test
// func test_varray_mock() {
//     var a: VArray<Int64, $3> = [1, 2, 3]
//     unsafe {
//         @On(double_varray(_)).returns(42)
//         @Assert(double_varray(inout a), 42)
//     }
//     @Assert([a[0], a[1], a[2]] == [1, 2, 3])
// }
