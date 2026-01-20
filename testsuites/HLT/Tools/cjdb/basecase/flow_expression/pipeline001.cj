/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f1(x: Int8): Int8 {
    x + 1
}

func f2(x: Int16): Int16 {
    x + 2
}

func f3(x: Int32): Int32 {
    x + 3
}

func f4(x: Int64): Int64 {
    x + 3
}

func f5(x: IntNative): IntNative {
    x + 3
}

func f_1(x: UInt8): UInt8 {
    x + 1
}

func f_2(x: UInt16): UInt16 {
    x + 2
}

func f_3(x: UInt32): UInt32 {
    x + 3
}

func f_4(x: UInt64): UInt64 {
    x + 3
}

func f_5(x: UIntNative): UIntNative {
    x + 3
}

let a: Int8 = 1
var res = a |> f1
let a2: Int16 = 1
var res2 = a2 |> f2
let a3: Int32 = 1
var res3 = a3 |> f3
let a4: Int64 = 1
var res4 = a4 |> f4

main() {
    let a: Int8 = 1
    var res = a |> f1
    let a2: Int16 = 1
    var res2 = a2 |> f2
    let a3: Int32 = 1
    var res3 = a3 |> f3
    let a4: Int64 = 1
    var res4 = a4 |> f4
    let a5: IntNative = 1
    var res5 = a5 |> f5

    let a_: UInt8 = 1
    var res_ = a_ |> f_1
    let a2_: UInt16 = 1
    var res2_ = a2_ |> f_2
    let a3_: UInt32 = 1
    var res3_ = a3_ |> f_3
    let a4_: UInt64 = 1
    var res4_ = a4_ |> f_4
    let a5_: UIntNative = 1
    var res5_ = a5_ |> f_5
    0
}
