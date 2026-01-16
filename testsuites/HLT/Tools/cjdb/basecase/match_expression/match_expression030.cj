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

enum Command {
    | SetTimeUnit(TimeUnit)
    | GetTimeUnit
    | Quit
}

main() {
    let command = (SetTimeUnit(Year(2026)), SetTimeUnit(Year(2024)))
    var t1 = match (command) {
        case (SetTimeUnit(Year(year)), _) => "Set year ${year}"
        case (_, SetTimeUnit(Month(month))) => "Set month ${month}"
        case _ => "abc"
    }
    0
}
