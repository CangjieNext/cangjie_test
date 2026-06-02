main(): Unit {}
interface IA {
    func foo(): Int64 
}

class A<T> {}
struct B {}
interface IC {}

extend<T> A<T> {
    public func foo(): Int64 {2}
}

extend<T> A<T> where T <: IC {
    
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
