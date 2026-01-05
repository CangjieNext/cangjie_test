/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum TimeUnit {
    | Year(UInt64)
    | Month(UInt64)
}

main() {
    let x = Year(2)
    let s = match (x) {
        case Year(n) => "x has ${n * 12} months" // Matched.
        case TimeUnit.Month(n) => "x has ${n} months"
    }
    println(s)
}
