// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.math.*
func isEqual(a: Float64, b: Float64): Bool {
    return abs(a - b) <= 1e-6
}
func compare(x: Float64) {
    if (isEqual(x, 3.14)) {
        println("The value of x is Pi.")
    } else {
        println("The value of x is not Pi.")
    }
}