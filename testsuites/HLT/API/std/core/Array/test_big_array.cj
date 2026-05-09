/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC-1: %export JETVMPROP="-Xmx8G" && %run %run_opt %output %run_utest_opt %run_args
// ASSERT: scan OutOfMemoryError

import std.collection.*
import std.math.*

@Test
public class Test_Big_Array {
    @TestCase
    func testBigArray(): Unit {
        // we can only confirm it can pass compile
        // actual 64-bit array is huge and beyond modern physical machine capability
        let arr1 = Array<Int32>(Int64.Max, {i => Int32(i)})

        // Please note below code could run smoothly due to some optimizations,
        // Int64.Max length array is not actually allocated.
        // let arr1 = Array<Int32>(Int64.Max, repeat: 0)
    }
}
