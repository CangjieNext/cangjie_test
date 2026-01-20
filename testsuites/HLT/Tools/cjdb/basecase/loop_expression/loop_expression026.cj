/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    var sum = 0
    let array = [(1, 2), (3, 4), (5, 6)]
    for (i in 1..=100) {
        sum += i
        for ((x, y) in array) {
            println("${x}, ${y}")
        }
    }
    println(sum)
}
