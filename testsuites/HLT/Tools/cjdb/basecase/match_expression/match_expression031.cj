/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit {
    | Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

main(){
    let oneYear = TimeUnit.Year(1.0)
    var howManyHours: Float32 = match (oneYear) {
        case Year(y) where y > 0.0f32 => y * Float32(365 * 24)
        case Year(y) where y <= 0.0f32 => 0.0
        case Month(y, m) where y > 0.0f32 && m > 0.0f32 => y * Float32(365 * 24) + m * Float32(30 * 24)
        case Day(y, m, d) where y > 0.0f32 && m > 0.0f32 && d > 0.0f32 => y * Float32(365 * 24) + m * Float32(30 * 24) + d * Float32(24)
        case Hour(y, m, d, h) where y > 0.0f32 && m > 0.0f32 && d > 0.0f32 && h > 0.0f32 => y * Float32(365 * 24) + m * Float32(30 * 24) + d * Float32(24) + h
        case _ => 1.0
    }
    0
}
