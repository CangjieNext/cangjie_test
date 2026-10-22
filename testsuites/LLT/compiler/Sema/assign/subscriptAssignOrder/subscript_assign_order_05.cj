// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// The right value of a subscript assignment is still checked against the type of the 'value'
// parameter, so values that need an expected type are supported: literals of a narrower type than
// Int64, a lambda, an empty array literal and a call of a generic function.

func id<T>(value: T): T {
    value
}

class Box<T> {
    public var data: Array<T>

    public init(data: T) {
        this.data = [data]
    }

    public operator func [](index: Int64, value!: T): Unit {
        data[index] = value
    }

    public operator func [](index: Int64): T {
        data[index]
    }
}

main(): Int64 {
    var i8: Array<Int8> = [0]
    i8[0] = 1
    var u8: Array<UInt8> = [0]
    u8[0] = 1
    var f32: Array<Float32> = [0.0]
    f32[0] = 1.0
    var funcs: Array<() -> Int64> = [{=> 1}]
    funcs[0] = {=> 2}
    var nested: Array<Array<Int64>> = [[1]]
    nested[0] = []
    var ints: Array<Int64> = [0]
    ints[0] = id(42)
    var box = Box<Int8>(0)
    box[0] = 3
    if (i8[0] != 1 || u8[0] != 1 || f32[0] != 1.0 || funcs[0]() != 2 || nested[0].size != 0 ||
        ints[0] != 42 || box[0] != 3) {
        return 1
    }
    return 0
}
