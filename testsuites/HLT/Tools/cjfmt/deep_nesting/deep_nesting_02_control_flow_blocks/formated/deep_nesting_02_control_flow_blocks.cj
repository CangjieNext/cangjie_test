/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func deep(n: Int64): Int64 {
    var acc = 0
    if (n > 0) {
        for (i in 1..n) {
            while (i < n) {
                if (i % 2 == 0) {
                    match (i) {
                        case 0 => 0
                        case _ => -1
                    }
                } else {
                    acc = acc + 1
                }
            }
        }
    }
    let r = 0..=n
    var total = 0
    for (i in r) {
        total = total + i
    }
    return n + total
}

func safe(n: Int64): Int64 {
    try {
        if (n >= 0) {
            for (i in 0..n) {
                if (i == 3) {
                    throw Exception("boom")
                }
            }
        }
        return n
    } catch (e: Exception) {
        return -1
    } finally {
        println("done")
    }
}

main() {
    println(deep(3))
    println(safe(5))
}
