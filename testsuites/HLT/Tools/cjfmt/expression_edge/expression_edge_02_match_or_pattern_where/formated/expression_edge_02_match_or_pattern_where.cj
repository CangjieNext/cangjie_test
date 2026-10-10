/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func classify(n: Int64): String {
    let r = match (n) {
        case 1 | 2 => "small"
        case 3 | 4 | 5 => "mid"
        case _ => "big"
    }
    return r
}

func matchExpr(n: Int64): Int64 {
    return match (n) {
        case 0 => 100
        case m => m * 10
    }
}

func filterEven(): Int64 {
    let src = [1, 2, 3, 4, 5, 6]
    var count = 0
    var last = 0
    for (i in src where i % 2 == 0) {
        count++
        last = i
    }
    let idx = src[2]
    let calc = src[idx - 1] * 2 + 1
    return count + last + calc + matchExpr(4)
}

main() {
    println(classify(2))
    println(filterEven())
}
