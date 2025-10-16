/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

internal import std.time.*

main() {
    let timeZone1 = TimeZone.UTC
    let dateTime1 = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0,
        timeZone: timeZone1)
    var res1 = dateTime1.inUTC().toString()

    var timeZone2 = TimeZone("Asia/Nanjing",
        (25 * Duration.hour) + (59 * Duration.minute) + (59 * Duration.second) + (59 * Duration.millisecond))
    var dateTime2 = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0,
        timeZone: timeZone2)
    var res2 = dateTime2.inUTC().toString()

    var timeZone3 = TimeZone("Asia/Nanjing",
        (-24 * Duration.hour) - (59 * Duration.minute) - (59 * Duration.second) - (59 * Duration.millisecond))
    var dateTime3 = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0,
        timeZone: timeZone3)
    var res3 = dateTime3.inUTC().toString()

    var timeZone4 = TimeZone("Asia/Nanjing", Duration.Zero)
    var dateTime4 = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0,
        timeZone: timeZone4)
    var res4 = dateTime4.inUTC().toString()
    0
}
