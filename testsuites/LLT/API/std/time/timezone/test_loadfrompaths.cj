/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Windows) DEPENDENCE: ../zoneinfo.tar.gz
// (Windows) EXEC: tar -xf zoneinfo.tar.gz
// (Windows) EXEC: mkdir 中文路径
// (Windows) EXEC: tar -xf zoneinfo.tar.gz -C 中文路径
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (Unix)EXEC-PIPE: %run %run_opt %output %run_args
// (Windows) RUN-EXEC-PIPE-0: set CJ_TZPATH=%pwd\zoneinfo\&& %run %run_opt %output %run_utest_opt %run_args

import std.time.*
import std.collection.*
import std.fs.*

func buildLongStr(): String {
    var str = StringBuilder("a")
    for (_ in 0..12) {
        str.append(str)
    }
    return str.toString()
}

let longStr = buildLongStr()
@When[os != "Windows"]
let zoneinfoPath: String = "/usr/share/zoneinfo/"
@When[os != "Windows"]
let tzPath1: String = "/usr/share/zoneinfo1/"
@When[os != "Windows"]
let tzPath2: String = "/usr/share/zoneinfo2/"
@When[os != "Windows"]
let tzPath: String = "/usr/share/zoneinfo/"
@When[os == "Windows"]
let zoneinfoPath: String = canonicalize(Path(".")).toString() + "\\zoneinfo"
@When[os == "Windows"]
let tzPath1: String = ".\\zoneinfo1\\"
@When[os == "Windows"]
let tzPath2: String = ".\\zoneinfo2\\"
@When[os == "Windows"]
let tzPath: String = ".\\zoneinfo\\"

@Test
class LoadFromPathsTest {
    @TestCase
    func loadfrompaths(): Unit {
        var timeZone = TimeZone.loadFromPaths("Asia/Urumqi", [zoneinfoPath])
        @Expect(timeZone.toString(), "Asia/Urumqi")
        @Expect(timeZone.id, "Asia/Urumqi")
        var dateTime = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0,
            nanosecond: 0, timeZone: timeZone)
        @Expect(dateTime.toString(), "2023-03-30T00:00:00+06:00")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "Asia/Urumqi")
        @Expect(dateTime.zoneOffset, 6 * Duration.hour)

        timeZone = TimeZone.loadFromPaths("Asia/Urumqi", ["", longStr, zoneinfoPath, "abc"])
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
    func loadfrompathsException(): Unit {
        try {
            TimeZone.loadFromPaths("", [zoneinfoPath])
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid timezone id"))
        }

        try {
            TimeZone.loadFromPaths(longStr, [zoneinfoPath])
            @Expect(false)
        } catch (e: InvalidDataException) {
            @Expect(e.message, "No valid timezone file is found.")
        }

        try {
            TimeZone.loadFromPaths(longStr + "a", [zoneinfoPath])
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid timezone id"))
        }

        try {
            TimeZone.loadFromPaths("a..b", [zoneinfoPath])
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid timezone name.")
        }

        try {
            TimeZone.loadFromPaths("a\0b", [zoneinfoPath])
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid timezone name.")
        }

        try {
            TimeZone.loadFromPaths("/ab", [zoneinfoPath])
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid timezone name.")
        }

        try {
            TimeZone.loadFromPaths("\\ab", [zoneinfoPath])
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid timezone name.")
        }

        try {
            TimeZone.loadFromPaths("Asia/Urumqi", [])
            @Expect(false)
        } catch (e: InvalidDataException) {
            @Expect(e.message, "No valid timezone file is found.")
        }

        try {
            TimeZone.loadFromPaths("Asia/Urumqi", ["", longStr, "abc"])
            @Expect(false)
        } catch (e: InvalidDataException) {
            @Expect(e.message, "No valid timezone file is found.")
        }

        try { // 4096 is max length of path in linux
            TimeZone.loadFromPaths("Asia/Urumqi", Array(10, repeat: "c" * (4097)))
            @Expect(false)
        } catch (e: InvalidDataException) {
            @Expect(e.message, "No valid timezone file is found.")
        }
    }
}

@When[os == "Windows"]
@Test
class LoadFromPathsTest_Win {
    let chinesePath: String = canonicalize(Path(".")).toString() + "\\中文路径\\zoneinfo"
    let uncPath: String = "\\\\?\\" + canonicalize(Path(".")).toString() + "\\中文路径\\zoneinfo"
    let docPath: String = "\\\\.\\" + canonicalize(Path(".")).toString() + "\\中文路径\\zoneinfo"

    @TestCase
    func loadfromchinesepath(): Unit {
        var timeZone = TimeZone.loadFromPaths("Asia/Urumqi", [chinesePath])
        @Expect(timeZone.toString(), "Asia/Urumqi")
        @Expect(timeZone.id, "Asia/Urumqi")
        var dateTime = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0,
            nanosecond: 0, timeZone: timeZone)
        @Expect(dateTime.toString(), "2023-03-30T00:00:00+06:00")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "Asia/Urumqi")
        @Expect(dateTime.zoneOffset, 6 * Duration.hour)
    }

    @TestCase
    func loadfromuncpath(): Unit {
        var timeZone = TimeZone.loadFromPaths("Asia\\Urumqi", [uncPath])
        @Expect(timeZone.toString(), "Asia\\Urumqi")
        @Expect(timeZone.id, "Asia\\Urumqi")
        var dateTime = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0,
            nanosecond: 0, timeZone: timeZone)
        @Expect(dateTime.toString(), "2023-03-30T00:00:00+06:00")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "Asia\\Urumqi")
        @Expect(dateTime.zoneOffset, 6 * Duration.hour)
    }

    @TestCase
    func loadfromdocpath(): Unit {
        var timeZone = TimeZone.loadFromPaths("Asia/Urumqi", [docPath])
        @Expect(timeZone.toString(), "Asia/Urumqi")
        @Expect(timeZone.id, "Asia/Urumqi")
        var dateTime = DateTime.of(year: 2023, month: March, dayOfMonth: 30, hour: 0, minute: 0, second: 0,
            nanosecond: 0, timeZone: timeZone)
        @Expect(dateTime.toString(), "2023-03-30T00:00:00+06:00")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "Asia/Urumqi")
        @Expect(dateTime.zoneOffset, 6 * Duration.hour)
    }
}
