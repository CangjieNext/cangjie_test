/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface J {
    func jtag(): Int64
}

interface K {
    func tag(): Int64
}

class D <: J & K {
    public func jtag(): Int64 {
        return 1
    }

    public func tag(): Int64 {
        return 2
    }
}

func multi<T>(v: T): Int64 where T <: J & K {
    return v.jtag() + v.tag()
}

func optTypes(x: ? Int64): Int64 {
    return x ?? 0
}

func nestedGeneric(): Int64 {
    let m: Array<Array<Int64>> = [[1, 2], [3, 4]]
    let n: Array<Array<Int64> > = [[5], [6]]
    return m[0][0] + m[1][1] + n[0][0] + n[1][0]
}

func interpNested(a: Int64, b: Int64): Unit {
    println("outer ${a + 1} inner ${b * 2}")
    println("nest ${"${a}-${b}"}")
}

func strSize(s: ?String): Int64 {
    return s?.size ?? 0
}

func callOpt(f: Option<(Int64) -> Int64>): Int64 {
    return f?(5) ?? 0
}

main() {
    println(multi(D()))
    println(optTypes(9))
    println(nestedGeneric())
    interpNested(1 , 2)
    println(strSize("hello"))
    println(callOpt({ x: Int64 => x + 1 }))
}
