class A {}

extend A {
    public func foo(): Int64 { 1 }
}

extend A {
    public func bar(): Int64 { 2 }
}

main(): Int64 {
    let a = A()
    a.bar() - a.foo()
}

extend A {
    public static func ram(): Int64 { 1 }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
