/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: double.c

// EXEC: %clang %clang_shared_opt double.c -o libtest_inout.%dylib_suffix
// EXEC: %compiler %cmp_opt -L./ -ltest_inout -Woff=all %f -o %output %cmp_utest_opt --mock=on 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

foreign func times2(x: CPointer<Int64>): Unit

var x: Int64 = 10

@Test
func test() {
    @On(x = _).doesNothing()
    unsafe {
        @Assert(x, 10)
        x = 20
        @Assert(x, 10)

        @Assert(x, 10)
        times2(inout x)
        @Assert(x, 10)
    }
}