/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func wrapMe(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64, f: Int64, g: Int64, h: Int64, i: Int64, j: Int64,
    k: Int64, l: Int64): Int64 {
    return a + b + c + d + e + f + g + h + i + j + k + l
}

let callResult = wrapMe(1000000, 2000000, 3000000, 4000000, 5000000, 6000000, 7000000, 8000000, 9000000, 1000000,
    1100000, 1200000)
let wideSum = 1000 + 1000 + 1000 + 1000 + 1000 + 1000 + 1000 + 1000 + 1000 + 1000 + 1000 + 1000 + 1000 + 1000 + 1000 +
    1000 + 1000

class ChainDemo {
    public func step(n: Int64): ChainDemo {
        return this
    }
}

main() {
    let shortChain = ChainDemo().step(1).step(2).step(3)
    let longChain = ChainDemo()
        .step(1)
        .step(2)
        .step(3)
        .step(4)
        .step(5)
        .step(6)
        .step(7)
        .step(8)
        .step(9)
        .step(10)
        .step(11)
        .step(12)
        .step(13)
        .step(14)
        .step(15)
        .step(16)
    longChain.step(17)
    shortChain.step(4)
    println("${callResult + wideSum}")
}
