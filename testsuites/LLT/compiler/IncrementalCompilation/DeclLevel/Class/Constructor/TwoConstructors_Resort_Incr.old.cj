class A {
    let v: Int64
    init(a: Int32) { v = 1 }
    init(a: Int64) { v = 0 }
}
main(): Int64 {
    let a = A(3)
    return a.v
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
