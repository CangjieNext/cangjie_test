class A {}
interface B {
    func foo(   a: Int32): Unit 
    mut prop goo: Int64 {
        get() {1}
        set (
                v 
        )
        {}
    }
}

extend A <: B {
    public func foo(   a: Int32)
    : Unit {}

    public mut prop goo: Int64 {
        get() {1}
        set (
                v 
        )
        {}
    }
}

extend A {
    func bar(   a: Int64)
    : Unit {}

    mut prop hair: Int64 {
        get() {1}
        set (
                v 
        )
        {}
    }
}

main(): Unit {}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
