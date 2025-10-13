package p
class A {
    private let a: Int64 = 0
    protected var b: (Int32, Int64) = (-1, 0)
    public var d: Array<Int32> = Array<Int32>(10) { r => Int32(3*r) }
    let c: () -> Unit = { => println(); () }
}

enum B {
    R|K 
    public prop k: Int32 {
        get() {
            var a = 15
            let c = 9
            a = a + c 
            a = a - c
            a = a + c 
            a = a - c
            a = a + c 
            a = a - c
            a = a + c 
            a = 1
            a = a - c
            a = a + c 
            a = a - c
            a = a + c 
            a = a - c
            a = a + c 
            a = a - c
            a = a + c 
            a = a - c
            Int32(a)
        }
    }
}
struct C {
    func foo(): Unit {
        var a = 3
        let b = 1
        a = a + b
        a = a + b
        for (i in 0..3){
        a = a + b}
        a = a + b
        a = a + b
        a = a + b
        a = a + b
        a = a + b
        a = a + b
        a = a + b
        a = a + b
        a = a + b
        a = a + b
        a = a + b
    }
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
