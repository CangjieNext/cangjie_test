// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package up

interface I {
    func foo(): Int8 { 0 }
}

public open class C0 <: I {
    protected var a: Int8 = 0
    public open func hoo(): Int8 { a + 1 }

    @Frozen
    public func foo(): Int8 { hoo() }
}

public open class C1 <: C0 {
    public open func hoo(): Int8 {
        mp = 1
        goo() + p + mp
    }
    public open func goo(): Int8 {
        1
    }
    public open prop p: Int8 {
        get () {
            1
        }
    }
    public open mut prop mp: Int8 {
        get () {
            a
        }
        set (value) {
            a = value
        }
    }
}

public class C2 <: C1 {
    public func hoo(): Int8 {
        mp = 2
        mp
    }
    public mut prop mp: Int8 {
        get () {
            a
        }
        set (value) {
            a = value
        }
    }
}