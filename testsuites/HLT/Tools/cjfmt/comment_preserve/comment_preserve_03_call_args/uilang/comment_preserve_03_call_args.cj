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

main() {
    let r = wrapMe(1000000, 2000000, 3000000, // first group
        4000000, 5000000, 6000000, 7000000, 8000000, 9000000, // second group
        10000000, 11000000,
        12000000)
    println("${r}")
}
