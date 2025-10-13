/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return run()
}

var m: Int32 = 0
var n: Int32 = 0
var l: Int32 = 0
var k: Int32 = 0
var p: Int32 = 0

func run(): Int64 {
    var x: Int32 = 10
    var y = 10
    var a1: (Int32) -> Int32 = foo1
    var a2: () -> Int32 = foo2
    var a3: () -> Unit = foo3
    var a4: (Unit) -> Unit = foo4
    var a5: (() -> Unit) -> () -> Unit = foo5
    var a6: ((() -> Unit) -> () -> Unit) -> (() -> Unit) -> () -> Unit = foo6
    var a7: () -> Unit = foo7
    var a8: (() -> Unit) -> () -> Unit = foo8
    var a9: (() -> Unit) -> () -> Unit = {
        a3 =>
        var a: () -> Unit = {=> ()};
        a
    }
    var a10: Unit = (((((((((((((((((((((((())))))))))))))))))))))))

    var data: Data = Data() // B103尚未支持class实例访问内部函数

    //    var b1:(Int32)->Int32 = data.foo1
    //    var b2:()->Int32 = data.foo2
    //    var b3:()->Unit = data.foo3
    //    var b4:(Unit)->Unit = data.foo4
    //    var b5:(()->Unit)->()->Unit = data.foo5
    //    var b6:((()->Unit)->()->Unit)->(()->Unit)->()->Unit = data.foo6
    var rec: Rectang = Rectang()
    var ice: IceCream = IceCream()

    if (a1(x) != 10) {
        return 1
    }
    if (a2() != 10) {
        return 1
    }
    a3()
    if (m != 1) {
        return 1
    }
    a4(a3())
    if (m != 2) {
        return 1
    }
    a5(a3)()
    if (m != 3) {
        return 1
    }
    a6(a5)(a3)()
    if (m != 4) {
        return 1
    }
    a7()
    if (m != 5) {
        return 1
    }
    a8(foo3)()
    if (m != 6) {
        return 1
    }
    if (data.foo1(x) != 10) {
        return 1
    }
    if (data.foo2() != 10) {
        return 1
    }
    data.foo3()
    if (n != 1) {
        return 1
    }
    data.foo4(data.foo3())
    if (n != 2) {
        return 1
    }
    //   data.foo5(data.foo3)()
    //   }
    //   data.foo6(data.foo5)(data.foo3)()
    //   }
    if (rec.foo1(x) != 10) {
        return 1
    }
    if (rec.foo2() != 10) {
        return 1
    }
    rec.foo3()
    if (l != 1) {
        return 1
    }
    rec.foo4(rec.foo3())
    if (l != 2) {
        return 1
    }
    if (IceCream.foo1(x) != 10) {
        return 1
    }
    if (IceCream.foo2() != 10) {
        return 1
    }
    IceCream.foo3()
    if (k != 1) {
        return 1
    }
    IceCream.foo4(IceCream.foo3())
    if (k != 2) {
        return 1
    }
    if (ice.foo11(x) != 10) {
        return 1
    }
    if (ice.foo12() != 10) {
        return 1
    }
    ice.foo13()
    if (p != 1) {
        return 1
    }
    ice.foo14(ice.foo13())
    if (p != 2) {
        return 1
    }
    return 0
}

func foo8(a!: () -> Unit = foo3): () -> Unit {
    return a
}

func foo7() {
    m = m + 1
}

func foo6(a: (() -> Unit) -> () -> Unit): (() -> Unit) -> () -> Unit {
    return a
}

func foo5(a: () -> Unit): () -> Unit {
    return a
}

func foo4(a: Unit): Unit {
    return a
}

func foo3(): Unit {
    m = m + 1
}

func foo2(): Int32 {
    return 10
}

func foo1(a: Int32): Int32 {
    return a
}

class Data {
    public func foo6(a: (() -> Unit) -> () -> Unit): (() -> Unit) -> () -> Unit {
        return a
    }
    public func foo5(a: () -> Unit): () -> Unit {
        return a
    }
    public func foo4(a: Unit): Unit {
        return a
    }
    public func foo3(): Unit {
        n = n + 1
    }
    public func foo2(): Int32 {
        return 10
    }
    public func foo1(a: Int32): Int32 {
        return a
    }
}

struct Rectang {
    public func foo6(a: (() -> Unit) -> () -> Unit): (() -> Unit) -> () -> Unit {
        return a
    }
    public func foo5(a: () -> Unit): () -> Unit {
        return a
    }
    public func foo4(a: Unit): Unit {
        return a
    }
    public func foo3(): Unit {
        l = l + 1
    }
    public func foo2(): Int32 {
        return 10
    }
    public func foo1(a: Int32): Int32 {
        return a
    }
}

interface Ice {
    static func foo6(a: (() -> Unit) -> () -> Unit): (() -> Unit) -> () -> Unit {
        return a
    }
    static func foo5(a: () -> Unit): () -> Unit {
        return a
    }
    static func foo4(a: Unit): Unit {
        return a
    }
    static func foo3(): Unit {
        k = k + 1
    }
    static func foo2(): Int32 {
        return 10
    }
    static func foo1(a: Int32): Int32 {
        return a
    }
    func foo16(a: (() -> Unit) -> () -> Unit): (() -> Unit) -> () -> Unit {
        return a
    }
    func foo15(a: () -> Unit): () -> Unit {
        return a
    }
    func foo14(a: Unit): Unit {
        return a
    }
    func foo13(): Unit {
        p = p + 1
    }
    func foo12(): Int32 {
        return 10
    }
    func foo11(a: Int32): Int32 {
        return a
    }
}

class IceCream <: Ice {}
