/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func arith(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64, f: Int64): Int64 {
    let r1 = a + b * c - d / e % f
    let r2 = (a + b) * c - d / (e - f)
    let r3 = a * b + c * d - e * f + a % b
    let t9 = !!(a > 0)
    var acc = 0
    acc = acc + a * b - c
    acc = acc + (a - b) * 2
    return r1 + r2 + r3 + acc
}

main() {
    println(arith(1, 2, 3, 4, 5, 6))
}
