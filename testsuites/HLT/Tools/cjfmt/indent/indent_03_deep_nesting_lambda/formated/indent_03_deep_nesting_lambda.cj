/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Outer {
    public init() {
    }
    public func deep(n: Int64): Int64 {
        if (n > 0) {
            for (i in 1..n) {
                var acc = 0
                while (acc < i) {
                    acc = acc + 1
                }
            }
        }
        return 0
    }
}

func apply(f: (Int64) -> Int64, v: Int64): Int64 {
    return f(v)
}

main() {
    let r = apply({
        x: Int64 => x * 2
    }, 5)
    println(r)
    println(Outer().deep(3))
}
