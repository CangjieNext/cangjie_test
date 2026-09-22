/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func classify(n: Int64): Int64 {
    if (n > 10) {
        return 1
    } else if (n > 5) {
        return 2
    } else {
        return 3
    }
}

func scan(n: Int64): Int64 {
    var total = 0
    for (i in 0..n) {
        total = total + i
    }
    while (total > 100) {
        total = total / 2
    }
    return total
}

main() {
    println(classify(20))
    println(scan(50))
}
