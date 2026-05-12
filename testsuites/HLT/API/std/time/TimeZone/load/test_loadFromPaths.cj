/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows) DEPENDENCE: ../../zoneinfo.tar.gz
// (Windows) EXEC: tar -xf zoneinfo.tar.gz
// DEPENDENCE : Shanghai
// DEPENDENCE : errorTimeZone
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows and not iOS)RUN-EXEC: %run %run_opt %output %run_args 
// (Windows) RUN-EXEC-PIPE-0: %export "CJ_TZPATH=%cd%/zoneinfo" && %run %run_opt %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.process.*

@When[os == "macOS"]
let resnum = 0
@When[os == "macOS"]
let str = "/usr/share/zoneinfo"
@When[os == "iOS"]
let resnum = 1
@When[os == "iOS"]
let str = "/usr/share/zoneinfo"
@When[os == "Windows"]
let resnum = 0
@When[os == "Windows"]
let str = Process.current.getEnv("CJ_TZPATH").getOrThrow()
@When[os == "Linux"]
let resnum = 1
@When[os == "Linux"]
let str = "/usr/share/zoneinfo"

@Test
class Test_loadFromPaths {
    @TestCase
    func test_loadFromPaths_01(): Unit {
        var flag_1 = 0
        let tzpath: Array<String> = ["./"]
        try {
            let zone = TimeZone.loadFromPaths("shanghai", tzpath)
        } catch (e: InvalidDataException) {
            @Assert(e.message, "No valid timezone file is found.")
            flag_1 = flag_1 + 1
        }
        @Expect(flag_1, resnum)
    }

    @TestCase
    func test_loadFromPaths_02(): Unit {
        var flag = false
        let tzpath: Array<String> = ["./"]
        try {
            let zone = TimeZone.loadFromPaths("", tzpath)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("Invalid timezone id"))
            flag = true
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_loadFromPaths_03(): Unit {
        var flag = false
        let tzpath: Array<String> = ["./"]
        let id = "z" * 4097
        try {
            let zone = TimeZone.loadFromPaths(id, tzpath)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("Invalid timezone id"))
            flag = true
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_loadFromPaths_04(): Unit {
        var flag = false
        let tzpath: Array<String> = []
        try {
            let zone = TimeZone.loadFromPaths("Shanghai", tzpath)
        } catch (e: InvalidDataException) {
            @Assert(e.message, "No valid timezone file is found.")
            flag = true
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_loadFromPaths_05(): Unit {
        var flag = false
        let tzpath: Array<String> = [""]
        try {
            let zone = TimeZone.loadFromPaths("Shanghai", tzpath)
        } catch (e: InvalidDataException) {
            @Assert(e.message, "No valid timezone file is found.")
            flag = true
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_loadFromPaths_06(): Unit {
        var flag = false
        let tzpath: Array<String> = ["\0"]
        try {
            let zone = TimeZone.loadFromPaths("Shanghai", tzpath)
        } catch (e: InvalidDataException) {
            @Assert(e.message, "No valid timezone file is found.")
            flag = true
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_loadFromPaths_07(): Unit {
        var flag = false
        let tzpath: Array<String> = ["/errorTimeZone"]
        try {
            let zone = TimeZone.loadFromPaths("Shanghai", tzpath)
        } catch (e: InvalidDataException) {
            @Assert(e.message, "No valid timezone file is found.")
            flag = true
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_loadFromPaths_08(): Unit {
        let tzpath: Array<String> = ["./", "/errorTimeZone"]
        let zone = TimeZone.loadFromPaths("Shanghai", tzpath)
        let datetime = DateTime.now(timeZone: zone)
        @Expect(datetime.zoneOffset, Duration.hour * 8)
        @Expect(zone.id, "Shanghai")
    }

    @TestCase
    func test_loadFromPaths_09(): Unit {
        let tzpath: Array<String> = ["/errorTimeZone", "./"]
        let zone = TimeZone.loadFromPaths("Shanghai", tzpath)
        let datetime = DateTime.now(timeZone: zone)
        @Expect(datetime.zoneOffset, Duration.hour * 8)
        @Expect(zone.id, "Shanghai")
    }

    @TestCase
    func test_loadFromPaths_10(): Unit {
        Process.current.removeEnv("CJ_TZPATH")
        Process.current.setEnv("CJ_TZPATH", "errorpath")
        let tzpath: Array<String> = ["./", "/errorTimeZone"]
        let zone = TimeZone.loadFromPaths("Shanghai", tzpath)
        let datetime = DateTime.now(timeZone: zone)
        @Expect(datetime.zoneOffset, Duration.hour * 8)
        @Expect(zone.id, "Shanghai")
        Process.current.removeEnv("CJ_TZPATH")
    }
    @TestCase
    func test_loadFromPaths_11(): Unit {
        let tzpath: Array<String> = [str]
        let zone1 = TimeZone.loadFromPaths("UTC", tzpath)
        let datetime1 = DateTime.now(timeZone: zone1)
        @Expect(datetime1.zoneOffset, Duration.Zero)
        @Expect(zone1.id, "UTC")
    }
}
