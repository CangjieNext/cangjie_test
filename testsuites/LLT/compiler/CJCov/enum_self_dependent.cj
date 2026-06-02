// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan-txt 2020/12
enum TimeUnit1 {
    Year(Int32) | Month(Int32) | Day | Two(TimeUnit1, TimeUnit1)
}

main(): Int64 {
    let time1 = Two(Year(2020), Month(12))
    let howManyHours1: Int32 = match (time1) {
        case Year(x) => x
        case Month(y) => y
        case Day => 24
        case Two(x, y) =>
            let year: Int32 = match (x) {
                case Year(p) => p
                case Month(q) => q
                case Day => 24
                case Two(p, q) => 0
            }
            let month: Int32 = match (y) {
                case Year(p) => p
                case Month(q) => q
                case Day => 24
                case Two(p, q) => 0
            }
            print("${year}/${month}\n")
            2
    }
    if (howManyHours1 != 2) {
        return 1
    }
    return 0
}
