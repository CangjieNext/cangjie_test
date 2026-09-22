/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I {
    func tag(): Int64
}

class C1<:I {
    public func tag(): Int64 {
        return 1
    }
}

class C2  <:  I {
    public func tag(): Int64 {
        return 2
    }
}

func gen<T>(v: T): Int64 where T<:I {
    return v.tag()
}

func negEdge(a: Int64, b: Int64): Int64 {
    let z1 = a- -b
    let z2 = a*-  b
    let z3 = -  a
    return z1 + z2 + z3
}

func stepColon(): Int64 {
    var t = 0
    for (i in 10..0:-2) {
        t += i
    }
    return t
}

func inFor(): Int64 {
    var t = 0
    for (i  in  0..3) {
        t += i
    }
    return t
}

func notParen(a: Bool, b: Bool): Bool {
    return ! (a && b) || !a
}

let messyLambda = { x : Int64 => x + 1 }

func semi(): Int64 {
    let a = 1 ;let b = 2
    return a + b
}

func optIdx(arr: ?Array<Int64>): Int64 {
    let v = arr?[0] ?? 0
    return v
}

main() {
    println(gen(C1()))
    println(gen(C2()))
    println(negEdge(10 , 3))
    println(stepColon())
    println(inFor())
    println(notParen(true , false))
    println(messyLambda(9))
    println(semi())
    println(optIdx([1 , 2 , 3]))
}
