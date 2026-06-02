main() {}

open class A {
    prop foo: Int64 {
        get() {3 }
    }

    public open mut prop bar: Int32 {
        get() {4}
        set(v) {println(v)}
    }
}

open class B {
    protected open prop kar: Int64 {
        get() {3 }
    }

    public open mut prop bar: Int64 {
        get() {4}
        set(v) {println(v)}
    }
}

open class C <: B {
    func go1(): Unit {
        let a=kar 
        bar=16; let c=bar
        println(a-c)
    }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
