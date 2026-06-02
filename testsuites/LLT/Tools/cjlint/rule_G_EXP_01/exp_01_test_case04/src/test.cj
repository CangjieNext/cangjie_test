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
    let oneYear = TimeUnit.Year(1)
    var howManyHours: Int64 = match (oneYear) {
        case TimeUnit.Year(y) => y * 365 * 24 // matched
        case t: TimeUnit => 0
        case TimeUnit.Month(y, m) => y * 365 * 24 + m * 30 * 24
        case Day(y, m, d) => y * 365 * 24 + m * 30 * 24 + d * 24
        case Hour(y, m, d, h) => y * 365 * 24 + m * 30 * 24 + d * 24 + h
    }
}