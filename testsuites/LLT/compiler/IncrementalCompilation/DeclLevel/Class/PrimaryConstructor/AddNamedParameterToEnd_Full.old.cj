class A {
    var m: Int64

    A(a: Int64) {
        m = a + 1
    }
}
main(): Int64 {
    let a = A(-1)
    return a.m
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
