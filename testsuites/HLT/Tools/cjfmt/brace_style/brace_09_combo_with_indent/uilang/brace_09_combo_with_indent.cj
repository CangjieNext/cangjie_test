/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Shape {
    let name: String = "shape"
    public init() {
    }
    public func area(): Int64 {
        return 1
    }
    public func perimeter(): Int64 {
        return 2
    }
}

func allmanFunc(n: Int64): Int64 {
    var acc = 0
    for (i in 0..n) {
        acc = acc + i
    }
    while (acc < n) {
        acc = acc + 1
    }
    return acc
}

func classify(n: Int64): Int64 {
    if (n > 10) {
        return 1
    } else if (n > 5) {
        return 2
    } else {
        return 3
    }
}

func spin(): Int64 {
    var n = 0
    do {
        n = n + 1
    } while (n < 3)
    return n
}

func risky(n: Int64): Int64 {
    try {
        if (n < 0) {
            throw Exception("neg")
        }
        return n
    } catch (e: Exception) {
        return 0
    } finally {
        println("done")
    }
}

func pick(op: Int64): Int64 {
    match (op) {
        case 0 => 10
        case _ => 20
    }
}

main() {
    let s = Shape()
    println(s.area())
    println(s.perimeter())
    println(allmanFunc(3))
    println(classify(7))
    println(spin())
    println(risky(1))
    println(pick(0))
}
