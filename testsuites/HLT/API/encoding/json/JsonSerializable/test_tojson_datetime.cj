/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 

import std.time.*
import stdx.encoding.json.stream.*
import std.io.*

class writer <: ToString {
    var input = ByteBuffer()
    var jw = JsonWriter(input)

    public func toString(): String {
        jw.flush()
        return String.fromUtf8(readToEnd(input))
    }
}

let t = DateTime.of(year: 2024, month: Month.June, dayOfMonth: 20, hour: 14, minute: 42, second: 33, nanosecond: 0,
    timeZone: TimeZone("ABC", Duration.hour * 8))

@Test
class test_Datetime_serialize {
    @TestCase
    func test_DatetimeFormat_rfc3339() {
        var w = writer()
        w.jw.startObject()
        w.jw.writeName("time").writeValue(t)
        w.jw.endObject()
        @Assert(w.toString(),"{\"time\":\"2024-06-20T14:42:33+08:00\"}")
    }

    @TestCase
    func test_DatetimeFormat_rfc3339_2() {
        var w = writer()
        w.jw.writeConfig.dateTimeFormat = DateTimeFormat.RFC3339
        w.jw.startObject()
        w.jw.writeName("time").writeValue(t)
        w.jw.endObject()
        @Assert(w.toString(),"{\"time\":\"2024-06-20T14:42:33+08:00\"}")
    }

    @TestCase
    func test_DatetimeFormat_rfc1123() {
        var w = writer()
        w.jw.writeConfig.dateTimeFormat = DateTimeFormat.RFC1123
        w.jw.startObject()
        w.jw.writeName("time").writeValue(t)
        w.jw.endObject()
        @Assert(w.toString(),"{\"time\":\"Thu, 20 Jun 2024 14:42:33 ABC\"}")
    }

    @TestCase
    func test_DatetimeFormat_selfDefine() {
        var w = writer()
        w.jw.writeConfig.dateTimeFormat = "yyyy年MM月dd日HH时mm分ss秒OO"
        w.jw.startObject()
        w.jw.writeName("time").writeValue(t)
        w.jw.endObject()
        @Assert(w.toString(),"{\"time\":\"2024年06月20日14时42分33秒+08:00\"}")
    }
}
