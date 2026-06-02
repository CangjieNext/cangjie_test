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

import stdx.encoding.json.stream.*
import std.io.*
import std.time.*

@Test
class TestReadDatetime {
    @TestCase
    func testReadDatetime(): Unit {
        let jsonStr = ##""2024-06-20T14:42:33+08:00""##
        var bas = ByteBuffer(jsonStr.toArray())
        var reader = JsonReader(bas)
        let val = reader.readValue<DateTime>()
        @Assert(val.year, 2024)
        @Assert(val.month.value(), 6)
        @Assert(val.dayOfMonth, 20)
        @Assert(val.hour, 14)
        @Assert(val.minute, 42)
        @Assert(val.second, 33)
        @Assert(val.zoneOffset.toString(), "8h")
    }

    @TestCase
    func testReadDatetime2(): Unit {
        let jsonStr = ##""2024-06-20T14:42:33.123456+08:00""##
        var bas = ByteBuffer(jsonStr.toArray())
        var reader = JsonReader(bas)
        let val = reader.readValue<DateTime>()
        @Assert(val.year, 2024)
        @Assert(val.month.value(), 6)
        @Assert(val.dayOfMonth, 20)
        @Assert(val.hour, 14)
        @Assert(val.minute, 42)
        @Assert(val.second, 33)
        @Assert(val.nanosecond, 123456000)
        @Assert(val.zoneOffset.toString(), "8h")
    }

    @TestCase
    func testReadDatetimeException(): Unit {
        let jsonStr = ##""2024-06-20T14:42:33.123456789+08:00 30""##
        var bas = ByteBuffer(jsonStr.toArray())

        try {
            var reader = JsonReader(bas)
            let val = reader.readValue<DateTime>()
            println(val)
            @Assert(false)
        } catch (e: TimeParseException) {
            return
        }
    }

    @TestCase
    func testReadDatetimeException2(): Unit {
        let jsonStr = ##""2024年06-20T14:42:33.123456789+08:00""##
        var bas = ByteBuffer(jsonStr.toArray())

        try {
            var reader = JsonReader(bas)
            let val = reader.readValue<DateTime>()
            println(val)
            @Assert(false)
        } catch (e: TimeParseException) {
            return
        }
    }
}
