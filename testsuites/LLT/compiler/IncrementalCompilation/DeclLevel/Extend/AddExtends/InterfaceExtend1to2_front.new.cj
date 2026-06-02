class A {}
interface I1<T> {
    func foo(): Int64 
}
extend A <: I1<Int32> {
    public func foo(): Int64 { 1 }
}
extend A <: I1<Int32> {
    public func foo(): Int64 { 1 }
}

main() {
    let a: I1<Int32> = A()
    a.foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
