internal import std.time.*

main() {
    var dateTime = DateTime.ofUTC(year: 2023, month: 4, dayOfMonth: 10)
    var dateTime1 = DateTime.of(year: 2023, month: 4, dayOfMonth: 10, timeZone: TimeZone.load("Asia/Shanghai"))
    var dateTime2 = DateTime.ofUTC(year: 99999, month: 4, dayOfMonth: 10)
    var dateTime3 = DateTime.of(year: 2023, month: 4, dayOfMonth: 10, timeZone: TimeZone.load("Europe/Moscow"))
    0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
