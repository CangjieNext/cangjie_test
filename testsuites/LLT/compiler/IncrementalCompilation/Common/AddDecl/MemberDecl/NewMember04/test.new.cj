interface I1 {
    func fi1() : Int64
    mut prop v1 : Int64 {
        get() { 1 }
        set(v) { println("set v") }
    }
}
interface I2 <: I1 {
    func fi1() : Int64 {
        fi2()
    }
    func fi2() : Int64
}

interface I3 {
    func fi3() : Int64
    mut prop v : Int64
}


open class A <: I1 {
    func f1() : Int64 {
        1
    }
    public open func fi1() : Int64 {
        2
    }

    protected static func ss() : Int64 {
        3
    }
}

class B <: A & I2 {
    public func fi2() : Int64 {
        this.fi1()
    }
    static func ss() : Int64 {
        1
    }
}

func test(i: I3) : Int64 {
    i.v = i.fi3() + i.v
    return i.v
}

main() {
    let v : A = B()
    return v.fi1() + B.ss()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
