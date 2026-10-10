/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func digitRanges(n: Int64): Int64 {
    var total = 0
    for (i in 1..9) {
        total += i
    }
    for (j in 0..n : 2) {
        total += j
    }
    let d1 = 1.5 + 2.0
    let d2 = 0.5 * 4.0
    let d3 = if (n > 0) {
        1.0
    } else {
        2.0
    }
    return Int64(Float64(total) + d1 + d2 + d3)
}

main() {
    println(digitRanges(7))
}
