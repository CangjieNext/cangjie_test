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
    let command = SetTimeUnit(Year(2025))
    var a = match (command) {
        case SetTimeUnit(Year(year)) => "Set year ${year}"
        case GetTimeUnit => "Set month"
        case Quit => "Set day"
        case _ => "dd"
    }
    0
}
