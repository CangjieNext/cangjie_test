/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

 // DEPENDENCE: double.c

// EXEC: %clang %clang_shared_opt double.c -o libtest_static.%dylib_suffix
// EXEC: %compiler %cmp_opt -L./ -ltest_static -Woff=all %f -o %output %cmp_utest_opt --mock=on 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

foreign func times2(x: CPointer<Int64>): Unit

class A {
    public static var x: Int64 = 10

    public static func callmul2() {
        unsafe {
            times2(inout x)
        }
    }
}

@Test
func test() {
    unsafe {
        @On(A.x = _).doesNothing()

        times2(inout A.x)
        @Assert(A.x, 10)

        A.callmul2()
        @Assert(A.x, 10)
    }
}
