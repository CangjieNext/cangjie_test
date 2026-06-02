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
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows)RUN-EXEC: %run %run_opt %output %run_args 
// (Windows) RUN-EXEC-PIPE-0: %export "CJ_TZPATH=%cd%/zoneinfo" && %run %run_opt %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.process.*

@When[os != "Windows"]
let resflag1 = true
@When[os != "Windows"]
let resnum = 2
@When[os != "Windows"]
let str = "Asia/Shanghai"
@When[os == "Windows"]
let resflag1 = true
@When[os == "Windows"]
let resnum = 2
@When[os == "Windows"]
let str = Process.current.getEnv("CJ_TZPATH").getOrThrow()

@Test
class Test_load {
    @TestCase
    func test_load_01(): Unit {
        var flag1 = false
        try {
            let zone1 = TimeZone.load("")
        } catch (e: IllegalArgumentException) {
            flag1 = true
            @Expect(e.message.contains("Invalid timezone id"))
        }
        @Expect(flag1, true)

        let fd = "z" * 4097
        var flag2 = false
        try {
            let zone2 = TimeZone.load(fd)
        } catch (e: IllegalArgumentException) {
            flag2 = true
            @Expect(e.message.contains("Invalid timezone id"))
        }
        @Expect(flag2, true)

        var flag3 = false
        try {
            let zone3 = TimeZone.load("..")
        } catch (e: IllegalArgumentException) {
            flag3 = true
            @Expect(e.message.contains("Invalid timezone id"))
        }
        @Expect(flag3, true)

        var flag4 = false
        try {
            let zone4 = TimeZone.load("..")
        } catch (e: IllegalArgumentException) {
            flag4 = true
            @Expect(e.message.contains("Invalid timezone id"))
        }
        @Expect(flag4, true)

        var flag5 = false
        try {
            let zone5 = TimeZone.load("\0")
        } catch (e: IllegalArgumentException) {
            flag5 = true
            @Expect(e.message.contains("Invalid timezone id"))
        }
        @Expect(flag5, true)

        var flag6 = false
        try {
            let zone6 = TimeZone.load("/")
        } catch (e: IllegalArgumentException) {
            flag6 = true
            @Expect(e.message.contains("Invalid timezone id"))
        }
        @Expect(flag6, true)

        var flag7 = false
        try {
            let zone7 = TimeZone.load("\\")
        } catch (e: IllegalArgumentException) {
            flag7 = true
            @Expect(e.message.contains("Invalid timezone id"))
        }
        @Expect(flag7, true)
    }

    @TestCase
    func test_load_02(): Unit {
        var flag = false
        var cnt = 0
        try {
            let zone = TimeZone.load("not exist")
        } catch (e: InvalidDataException) {
            println(e.message)
            flag = true
            if (e.message.contains("/usr/share/zoneinfo") || (e.message == "No valid timezone file is found.")) {
                cnt = 1
            }
        }
        @Assert(flag, true)
        @Assert(cnt, 1)
    }

    @TestCase
    func test_load_03(): Unit {
        let zone1 = TimeZone.load("Asia/Shanghai")
        let datetime = DateTime.now(timeZone: zone1)
        @Expect(datetime.zoneOffset, Duration.hour * 8)
        @Expect(zone1.id, "Asia/Shanghai")

        var flag1 = false
        var cnt = 0
        try {
            let zone2 = TimeZone.load("Shanghai")
        } catch (e: InvalidDataException) {
            flag1 = true
            if (e.message.contains("/usr/share/zoneinfo") || (e.message == "No valid timezone file is found.")) {
                cnt = 1
            }
        }
        @Assert(cnt, 1)
        @Expect(flag1, true)

        var flag2 = false
        try {
            let zone3 = TimeZone.load("asai/Shanghai")
        } catch (e: InvalidDataException) {
            flag2 = true
            if (e.message.contains("/usr/share/zoneinfo") || (e.message == "No valid timezone file is found.")) {
                cnt = 2
            }
        }
        @Assert(cnt, resnum)
        @Expect(flag2, resflag1)
    }

    @TestCase
    func test_load_04(): Unit {
        let zone = TimeZone.load("UTC")
        let datetime = DateTime.now(timeZone: zone)
        @Expect(datetime.zoneOffset, Duration.Zero)
        @Expect(zone.id, "UTC")
    }

    @TestCase
    func test_load_06(): Unit {
        Process.current.removeEnv("CJ_TZPATH")
        Process.current.setEnv("CJ_TZPATH", "./")
        let zone = TimeZone.load("Shanghai")
        let datetime = DateTime.now(timeZone: zone)
        @Expect(datetime.zoneOffset, Duration.hour * 8)
        @Expect(zone.id, "Shanghai")
    }

    @TestCase
    func test_load_07(): Unit {
        var flag = false
        Process.current.removeEnv("CJ_TZPATH")
        Process.current.setEnv("CJ_TZPATH", "./test")
        try {
            let zone = TimeZone.load("shanghai")
        } catch (e: InvalidDataException) {
            @Expect(e.message, "No valid timezone file is found.")
            flag = true
        }
        @Expect(flag, resflag1)
    }

    @TestCase
    func test_load_08(): Unit {
        var flag = false
        Process.current.removeEnv("CJ_TZPATH")
        Process.current.setEnv("CJ_TZPATH", "./errorTimeZone")
        try {
            let zone = TimeZone.load("errorTimeZone")
        } catch (e: InvalidDataException) {
            @Assert(e.message, "Failed to parse the timezone file.")
            flag = true
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_load_09(): Unit {
        var flag = false
        Process.current.removeEnv("CJ_TZPATH")
        Process.current.setEnv("CJ_TZPATH", "./")
        let zone = TimeZone.load("Shanghai")
        let datetime = DateTime.now(timeZone: zone)
        @Expect(datetime.zoneOffset, Duration.hour * 8)
        @Expect(zone.id, "Shanghai")
    }

    @TestCase
    func test_load_10(): Unit {
        var flag = false
        Process.current.removeEnv("CJ_TZPATH")
        Process.current.setEnv("CJ_TZPATH", "./errorTimeZone:./")
        try {
            let zone = TimeZone.load("Shanghai")
        } catch (e: InvalidDataException) {
            if (e.message.contains("No valid timezone file is found.") || (e.message ==
                "Failed to parse the timezone file.")) {
                flag = true
            }
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_load_11(): Unit {
        Process.current.removeEnv("CJ_TZPATH")
        Process.current.setEnv("CJ_TZPATH", "./")
        let zone = TimeZone.load("Shanghai")
        let datetime = DateTime.now(timeZone: zone)
        @Expect(datetime.zoneOffset, Duration.hour * 8)
        @Expect(zone.id, "Shanghai")
    }
}
