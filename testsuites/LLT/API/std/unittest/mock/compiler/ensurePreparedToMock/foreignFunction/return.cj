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

foreign func times22(x: CPointer<Int64>): Int64

class A {
    public static var x: Int64 = 10

    public static func callmul2(): Int64 {
        unsafe {
            return times22(inout x)
        }
    }
}

@Test
func test() {
    unsafe {
        @On(A.x = _).doesNothing()

        let res1 = times22(inout A.x)
        @Assert(A.x, 10)
        @Assert(res1, 40)

        let res2 = A.callmul2()
        @Assert(A.x, 10)
        @Assert(res2, 40)
    }
}