class A {
    let c: Int64
    A(a: Int64, var b: Int64) {
        c = b
    }
}
main(): Int64 {
    return A(1, 2).c
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
