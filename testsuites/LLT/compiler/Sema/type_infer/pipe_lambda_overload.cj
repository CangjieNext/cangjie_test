// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

// Test type inference for pipe operator with trailing lambda calling overloaded functions
// This test verifies the fix for ICE in TypeCheckUtil.cpp where PSet checkpoint depth
// inconsistency caused SIGSEGV when using pipe operator with lambda and overloaded functions

import std.collection.*

func test(input: Array<Float64>) {
    input |> map { p => f(p + 1.0) } |> collectArray
}

func f(float: Float64): Float64 {
    println("inferred Float64")
    return float
}

func f(int: Int64): Int64 {
    println("inferred Int64")
    return int
}

main() {
    println("should infer Float64")
    test([1.0, 2.0])
    return 0
}

/* SCAN
should infer Float64
inferred Float64
inferred Float64
*/
