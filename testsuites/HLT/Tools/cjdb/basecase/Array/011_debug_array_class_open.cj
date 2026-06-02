/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */








open class C1 {
    public var a1: Int64 = 1
    public func foo1(): Int64 {
        return 1
    }
}

open class C2 <: C1 {
    public var a2: Int64
    public init(){
        super()
        a2 = super.a1
    }

    public func foo2(): Int64 {
        return super.foo1()
    }
}

class C3 <: C2 {
    public var a3: Int64
    public init(){
        super()
        a3 = super.a1
    }

    public func foo3(): Int64 {
        var x: Int64 = super.foo2()
        return x
    }
}


main():Int64 {
    var data1 = C1()
    var data2 = C2()
    var data3 = C3()

    var arraymainrec01 : Array<C1> = [data1,data2,data3]

    return 1
}











