abstract class A {
    let a: Int64 = 0
}
class B <: A {}
main(): Int64 {
    let b = B()
    return b.a
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
