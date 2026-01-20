/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.random.Random

main() {
    let random = Random()
    var totalPoints = 0
    var hitPoints = 0
    do {
        let x = random.nextFloat64()
        let y = random.nextFloat64()
        if ((x - 0.5) ** 2 + (y - 0.5) ** 2 < 0.25) {
            hitPoints++
        }
        totalPoints++
        var sum = 0
        for (i in 1..=100) {
            sum += i
        }
        var hundred: Int64 = 0
        while (hundred < 2) {
            hundred++
        }
    } while (totalPoints < 1000000)

    let pi = 4.0 * Float64(hitPoints) / Float64(totalPoints)
    println("${pi}")
}
