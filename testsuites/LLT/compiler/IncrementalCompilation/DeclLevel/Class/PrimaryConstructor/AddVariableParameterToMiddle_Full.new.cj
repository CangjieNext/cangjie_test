class A {
    var m: Int64
    A(a: Int64, b: Int64, var e: Int64, let c: Int64, var f: Int64) {
        m = a - b + c + e + f
    }
}
main(): Int64 {
    let a = A(1, 1, 2, -2, 2)
    return a.m + a.c
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
