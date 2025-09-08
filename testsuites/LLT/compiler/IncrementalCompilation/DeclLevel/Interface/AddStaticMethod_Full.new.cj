interface A {
    static func bar(): Int64
}
class B <: A {
    public func foo(): Int64 { 0 }
    public static func bar(): Int64 { 1 }
}
main(): Int64 {
    let a: B = B()
    return B.bar()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
