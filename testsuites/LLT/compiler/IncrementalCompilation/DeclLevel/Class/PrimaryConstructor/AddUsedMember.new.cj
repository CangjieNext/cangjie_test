class A {
    let v = 1
    A(a: Int64, let b!: Int64 = a + v) {}
}
main(): Int64 {
    let a = A(1)
    return a.b - 2
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
