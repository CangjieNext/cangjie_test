open class A {
    private var a = 0
    public prop b:Int64{
        get(){
            a
        }
    }
    public open func foo(): Int64 { 0 }
}

main(): Int64 {
    let a: A = A()
    return a.foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
