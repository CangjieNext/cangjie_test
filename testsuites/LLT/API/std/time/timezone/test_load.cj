/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Windows) DEPENDENCE: ../zoneinfo.tar.gz
// (Windows) EXEC: tar -xf zoneinfo.tar.gz
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (Unix)EXEC-PIPE: %run %run_opt %output %run_args
// (Windows) RUN-EXEC-PIPE-0: cmake -E env CJ_TZPATH=%pwd\zoneinfo\ %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.collection.*
import std.fs.*
import std.process.*

func buildLongStr(): String {
    var str = StringBuilder("a")
    for (_ in 0..12) {
        str.append(str)
    }
    return str.toString()
}

let longStr = buildLongStr()
@When[os == "Linux"]
let backend = true
@When[os != "Linux"]
let backend = false

@Test
class LoadTest {
    @TestCase
    func loadTimeZoneByString(): Unit {
        var timeZone = TimeZone.load("Asia/Urumqi")
        @Expect(timeZone.toString(), "Asia/Urumqi")
        @Expect(timeZone.id, "Asia/Urumqi")
        var dateTime = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0,
            nanosecond: 0, timeZone: timeZone)
        @Expect(dateTime.toString(), "2023-03-30T00:00:00+06:00")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "Asia/Urumqi")
        @Expect(dateTime.zoneOffset, 6 * Duration.hour)

        if (backend) {
            Process.current.removeEnv("CJ_TZPATH")
            Process.current.setEnv("CJ_TZPATH", "/usr/share/zoneinfo")
        }
        timeZone = TimeZone.load("Asia/Urumqi")
        @Expect(timeZone.toString(), "Asia/Urumqi")
        @Expect(timeZone.id, "Asia/Urumqi")
        dateTime = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0,
            timeZone: timeZone)
        @Expect(dateTime.toString(), "2023-03-30T00:00:00+06:00")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "Asia/Urumqi")
        @Expect(dateTime.zoneOffset, 6 * Duration.hour)

        if (backend) {
            Process.current.removeEnv("CJ_TZPATH")
            Process.current.setEnv("CJ_TZPATH", "")
        }
        timeZone = TimeZone.load("Asia/Urumqi")
        @Expect(timeZone.toString(), "Asia/Urumqi")
        @Expect(timeZone.id, "Asia/Urumqi")
        dateTime = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0, nanosecond: 0,
            timeZone: timeZone)
        @Expect(dateTime.toString(), "2023-03-30T00:00:00+06:00")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "Asia/Urumqi")
        @Expect(dateTime.zoneOffset, 6 * Duration.hour)
    }

    @TestCase
    func loadException(): Unit {
        try {
            TimeZone.load("")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid timezone id"))
        }

        try {
            TimeZone.load(longStr + "a")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid timezone id"))
        }

        try {
            TimeZone.load("a..b")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid timezone id"))
        }

        try {
            TimeZone.load("a\0b")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid timezone id"))
        }

        try {
            TimeZone.load("/ab")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid timezone id"))
        }

        try {
            TimeZone.load("\\ab")
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid timezone id"))
        }

        try {
            TimeZone.load("not exist")
            @Expect(false)
        } catch (e: InvalidDataException) {
            @Expect(e.message.contains("An error occurred when accessing file") || e.message.contains("No valid timezone file is found."), true)
        }

        Process.current.removeEnv("CJ_TZPATH")
        Process.current.setEnv("CJ_TZPATH", "/usr/share")
        try {
            TimeZone.load("Asia/Urumqi")
            @Expect(false)
        } catch (e: InvalidDataException) {
            @Expect(e.message, "No valid timezone file is found.")
        }
        Process.current.removeEnv("CJ_TZPATH")
    }
}
