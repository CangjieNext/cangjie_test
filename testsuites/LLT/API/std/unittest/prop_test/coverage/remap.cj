/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color

import std.unittest.prop_test.*
import std.random.*
import std.math.*

@Types[T in <Float16, Float32, Float64, Int8, Int16, Int32, Int64, IntNative, UInt8, UInt16, UInt32, UInt64, UIntNative>]
@Test[x in random()]
func min_max_boundary_is_ok<T>(x: T) where T <: ArbitraryRange<T> & MaxMinValue<T> {
    T.arbitraryRange(Random(), T.getMin(), T.getMax()).next()
}
