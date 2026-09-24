/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Combo {
    public static let s: Int64 = 1
    let v: Int64 = 0
    public init() {
    }
    public func add(a: Int64, b: Int64): Int64 {
        return a + b
    }
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

func mix(x: Int64, y: Int64): Int64 {
    let tuple = (x + 1, y + 2)
    let arr = [1, 2, 3]
    var acc = 0
    for (i in 0..x) {
        acc = acc + arr[i]
    }
    while (acc < 100) {
        acc = acc * 2
    }
    return acc + tuple[0] + y
}

main() {
    let c = Combo()
    println(c.add(1, 2))
    println(c.v)
    println(classify(7))
    println(mix(3, 4))
}
