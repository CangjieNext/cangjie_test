/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit {
    | Year(Int64)
    | Month(Int64, Int64)
    | Day(Int64, Int64, Int64)
    | Hour(Int64, Int64, Int64, Int64)
}

func howManyHours(oneYear: TimeUnit): Int64 {
    match (oneYear) {
        case Month(y, m) => return y + m
        case _: TimeUnit => return 0
        case Day(y, m, d) => return y + m + d
        case Hour(y, m, d, h) => return y + m + d + h
        case Year(y) => return y
    }
}

main() {
    println(howManyHours(Year(1)))
}
