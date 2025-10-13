class A {
    A(let b!: Int64 = 2, let a!: Int64 = 1) {}
}
main(): Int64 {
    let a = A()
    return a.a - a.b / 2
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
