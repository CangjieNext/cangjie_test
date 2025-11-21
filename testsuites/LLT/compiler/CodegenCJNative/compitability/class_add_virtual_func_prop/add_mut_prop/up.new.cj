// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package up

interface I {
    func foo(): Int64 { 0 }
}

public open class C0 <: I {
    protected var a: Int64 = 0
    public open func hoo(): Int64 { a + 1 }

    @Frozen
    public func foo(): Int64 { hoo() }
}

public open class C1 <: C0 {
    public open func hoo(): Int64 {
        goo = 2
        goo
    }
    public open mut prop goo: Int64 {
        get () {
            a
        }
        set (value) {
            a = value
        }
    }
}

public class C2 <: C1 {
    public func hoo(): Int64 {
        goo = 3
        goo
    }
    public open mut prop goo: Int64 {
        get () {
            a
        }
        set (value) {
            a = value
        }
    }
}