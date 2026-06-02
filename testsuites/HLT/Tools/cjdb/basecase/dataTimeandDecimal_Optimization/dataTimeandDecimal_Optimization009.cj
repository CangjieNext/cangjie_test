/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.time.*

main() {
    let timeZone1 = TimeZone.Local
    let dateTime1 = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0,
        timeZone: timeZone1)
    var res1 = dateTime1.inLocal()
    0
}
