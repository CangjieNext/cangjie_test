/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Nest {
    var acc: Int64 = 0
    public init() {
    }
    public func calc(n: Int64): Int64 {
        if (n > 0) {
            for (i in 0..n) {
                acc = acc + i
            }
        }
        return acc + n
    }
}

func mix(a: Int64, b: Int64): Int64 {
    let m = (a * b) + 2
    if (m > 10) {
        return m - a
    }
    return a + b
}

main() {
    let n = Nest()
    println(n.calc(3))
    println(mix(4, 5))
}
