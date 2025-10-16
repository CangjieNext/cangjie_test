class A<U, T> {
    A(let a: T, let u: U) {}
}
main(): Int64 {
    let a = A<Int32, Int64>(1, 2)
    return Int64(a.a) + Int64(a.u) * 2
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
