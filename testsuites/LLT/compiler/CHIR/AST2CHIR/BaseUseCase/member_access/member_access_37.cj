// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

internal import std.convert.*
internal import std.convert.*

open class A {
    protected func a(input: Int64): Int64 {
        input
    }

    protected func b(input: Int64): Int64 {
        input
    }

    protected func c(input: (Int64) -> Int64): Int64 {
        input(Int64.parse(Int64(Float64.tryParse(1.toString()).getOrThrow()).toString()))
    }
}

class B <: A {
    public func test() {
        Int64.parse(Int64(Float64.tryParse(1.toString()).getOrThrow()).toString()) |> a
        a ~> b
        Int64.parse(Int64(Float64.tryParse(1.toString()).getOrThrow()).toString()) |> (a ~> b)
        return (a ~> b |> c) - Int64.parse(Int64(Float64.tryParse(1.toString()).getOrThrow()).toString())
    }
}

main(): Int64 {
    var x = B()
    return x.test()
}
