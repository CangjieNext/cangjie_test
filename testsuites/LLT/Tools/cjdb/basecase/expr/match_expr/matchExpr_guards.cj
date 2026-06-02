// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum TimeUnit {
    | Year(Int64)
    | Month(Int64, Int64)
    | Day(Int64, Int64, Int64)
    | Hour(Int64, Int64, Int64, Int64)
}
main() {
    let oneYear = Year(1)
    var howManyHours: Int64 = match (oneYear) {
        case Year(y) where y > 0 => y * 365 * 24 // matched
        case Year(y) where y <= 0 => 0
        case Month(y, m) where y > 0 && m > 0 => y * 365 * 24 + m * 30 * 24
        case Day(y, m, d) where y > 0 && m > 0 && d > 0 => y * 365 * 24 + m * 30 * 24 + d * 24
        case _ => 0
    }
    0
}
