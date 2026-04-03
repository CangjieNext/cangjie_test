// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output

// Test type inference for pipe operator with trailing lambda calling overloaded functions
// This test verifies the fix for ICE when using pipe operator with map and overloaded functions

import std.collection.*

func test(input: Array<Float64>) {
    input |> map { p => f(p + 1.0) } |> collectArray
}

func f(float: Float64) { 
    println("inferred Float64")
    float
}

func f(int: Int64) { 
    println("inferred Int64")
    int
}

main() { 
    println("should infer Float64")
    test([1.0, 2.0])
    0
}
