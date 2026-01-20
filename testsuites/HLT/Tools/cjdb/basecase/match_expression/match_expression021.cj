/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit {
    | Year(Float32)
    | Month(Float32,Float32)
    | Day(Float32,Float32,Float32)
    | Hour(Float32,Float32,Float32,Float32)
}
main() {
    let oneYear = Year(1.0)
    var howManyHours:Float32 = match(oneYear) {
        case Year(y) => y*Float32(365*24)
        case Month(y,m) => y*Float32(365*24) +m*Float32(30*24)
        case Day(y,m,d) => y*Float32(365*24) +m*Float32(30*24)+ d*Float32(24)
        case Hour(y,m,d,h) => y*Float32(365*24) +m*Float32(30*24)+ d*Float32(24)+h
    }
    println("s")
}
