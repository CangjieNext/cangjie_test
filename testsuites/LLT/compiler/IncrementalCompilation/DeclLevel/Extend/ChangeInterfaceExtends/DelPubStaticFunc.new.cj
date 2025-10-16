class A {
    static func foo(a: Int32): Int64 {1}
}
interface I1 {}
extend A <: I1 {
    // public static func foo(a: Int64) {2}
}

main() {
    A.foo(0)
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
