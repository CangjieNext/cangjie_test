// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func foo(a: Int64): Int64

class A {
    var b: Int64
    let c: Int64
    A()
    init(a: Int64)
    ~init() 
    prop d: Int64
    func barm(): Unit

    static let m: Int32 
    static const g: Int64
    static var h: B
}

struct B {
    B()
    init(a: Int64)
    mut prop e: Int64
}

interface K {
    static func bar<T>(): T
    prop k: Int64
}

var a: Unit
const b: Unit
var (a1,b1): (Int64, Unit)

extend A <: K {
    public static func bar<T>(): T
    public prop k: Int64
}
