// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct Test<T, U, V> {
    public let a: T
    public let b: U
    public let c: V

    public init(x: T, y: U, z: V) {
        a = x
        b = y
        c = z
    }
}

func run(): Int64 {
    var a: Int64 = 1
    var b: Float64 = 2.2
    var c: Int64 = 2
    var res1: Int64
    var res2: Float64
    var res3: Int64
    var test: Test<Int64, Float64, Int64> = Test<Int64, Float64, Int64>(a, b, c)
    res1 = test.a
    res2 = test.b
    res3 = test.c
    if (res1 == 1 && res2 == 2.2 && res3 == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
