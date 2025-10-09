/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func foo() {
    foo1()

    var f0:Int64 = 1 
}

func foo1() {

    var f1:String = "cangjie"
}

interface I {
    func f(): Unit
}

class A <: I {

    public func f(): Unit {
        println("A.fff")
    }




}

main() {


    foo()
    foo1()

    let a: I = A()
    a.f()

    let b: B = B()
    b.f()


    let aExt: I = AExt()
    aExt.f()

    return 0
}

struct B <: I {
    public func f(): Unit {
    
        println("A.fff")
    }
}
