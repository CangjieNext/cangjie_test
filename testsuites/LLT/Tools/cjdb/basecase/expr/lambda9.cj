// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum RGB<T> {
    red(T) | green(Int64) | blue(Int64)
}

main(): Int64 {
    let op1 = RGB.red(1)
    let op2 = RGB<Float64>.blue(4)
    let lambda1 = {
        a: RGB<Int64>, b: RGB<Float64> => println("lamdda.....")
    }
    var op3 = lambda1(op1, op2)
    return 0
}
