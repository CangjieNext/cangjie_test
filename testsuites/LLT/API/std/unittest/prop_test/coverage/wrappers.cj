/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan 2
// ASSERT: scan 3
// ASSERT: scan 4
// ASSERT: scan 5

import std.unittest.prop_test.*
import std.random.*
import std.math.*

@Types[T in <
    TupleWrapper2<Int64, Int64>,
    TupleWrapper3<Int64, Int64, Int64>,
    TupleWrapper4<Int64, Int64, Int64, Int64>,
    TupleWrapper5<Int64, Int64, Int64, Int64, Int64>
>]
@Test[x in random()]
@Configure [generationSteps: 1, reductionSteps:0]
func shrink_helpers_tuple2<T>(x: T) where T <: IndexAccess {
    var i = 0
    while (x.getElementAsAny(i).isSome()) {
        i++
    }
    println(i)
}
