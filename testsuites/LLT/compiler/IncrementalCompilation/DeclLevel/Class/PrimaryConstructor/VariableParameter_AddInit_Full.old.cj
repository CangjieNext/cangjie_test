class A {
    A(a: Int64, let b!: Int64) {}
}
struct B {
    B(a: Int32, let b!: Int32, let c!: Int32, let d!: Int64 = 3) {

    }
}
struct C {
    C(a: Int32, let b!: Int32, let c!: Int64 = 3) {

    }
}
main(): Int64 {
    let a = A(1, b: 2)
    return a.b - 2
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
