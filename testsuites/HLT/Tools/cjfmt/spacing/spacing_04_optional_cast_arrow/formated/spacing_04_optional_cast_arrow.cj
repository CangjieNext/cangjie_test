/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func opt(x: ?Int64): Int64 {
    let a = x ?? 1
    let b = x ?? 2
    return a + b
}

class W {
    public func v(): Int64 {
        return 5
    }
}

func optW(x: ?W): Int64 {
    let c = x?.v() ?? 0
    return c
}

func casts(x: Any): Int64 {
    let ok = x is Int64
    let n = (x as Int64) ?? 0
    if (ok) {
        return n
    }
    return 0
}

let double = {x: Int64 => x * 2}

func apply(f: (Int64) -> Int64, v: Int64): Int64 {
    return f(v)
}

func pick(n: Int64): Int64 {
    match (n) {
        case 0 => 10
        case _ => n * 2
    }
}

func interp(a: Int64, b: Int64): Unit {
    println("sum ${a + b}")
    println("tight ${a + b}")
}

main() {
    println(opt(7))
    println(optW(W()))
    println(casts(42))
    println(apply(double, 5))
    println(pick(3))
    interp(1, 2)
}
