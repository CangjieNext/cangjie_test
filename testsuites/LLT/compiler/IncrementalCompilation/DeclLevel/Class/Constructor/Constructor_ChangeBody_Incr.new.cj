class A {
    let a: Int64 = 3
    var b: Int64
    init() {
        b = 12
    }
}
main(): Int64 {
    let a = A()
    return a.b - a.a * a.a
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
