// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.time.*
import std.collection.*

let timeZone1 = TimeZone.UTC
let dateTime1 = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 2, second: 2, nanosecond: 0, timeZone: timeZone1)

var timeZone2 = TimeZone("Asia/Nanjing", (25 * Duration.hour) + (59 * Duration.minute) + (59 * Duration.second) + (59 * Duration.millisecond))
var dateTime2 = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0, timeZone: timeZone2)
// hashmap
var map1 = HashMap<Int,DateTime>([(30, dateTime1), (3, dateTime2)])
var map2 = HashMap<DateTime,Int>([(dateTime1,2), (dateTime1,1)])

main() {
    0
}