class A {
    static let a: Int64 = 10
    ~init() {}
    static init() {}
}

struct B {
    static let b: Int64 = 1
    init() {}
}

main(): Int64 {
    A.a + B.b
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
