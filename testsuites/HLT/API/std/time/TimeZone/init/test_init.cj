/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@Test
class Test_init {
    @TestCase
    func test_init_01(): Unit {
        let zone = TimeZone("Asia/Shanghai", Duration.Zero)
        @Assert(zone.toString(), "Asia/Shanghai")
    }

    @TestCase
    func test_init_02(): Unit {
        let zone = TimeZone("    ", Duration.Zero)
        @Assert(zone.toString(), "    ")
    }

    @TestCase
    func test_init_03(): Unit {
        let zone = TimeZone("//", Duration.Zero)
        @Assert(zone.toString(), "//")
    }

    @TestCase
    func test_init_04(): Unit {
        let zone = TimeZone("测试", Duration.Zero)
        @Assert(zone.toString(), "测试")
    }

    @TestCase
    func test_init_05(): Unit {
        let zone = TimeZone("!@#$%^&*()", Duration.Zero)
        @Assert(zone.toString(), "!@#$%^&*()")
    }

    @TestCase
    func test_init_06(): Unit {
        let id = "z" * 4096
        let zone = TimeZone(id, Duration.Zero)
        @Assert(zone.toString(), id)
    }

    @TestCase
    func test_init_07(): Unit {
        let zone = TimeZone("UTC", Duration.Zero)
        @Assert(zone.toString(), "UTC")
    }

    @TestCase
    func test_init_08(): Unit {
        var flag = false
        try {
            let zone = TimeZone("", Duration.Zero)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("Invalid timezone id"))
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_init_09(): Unit {
        var flag = false
        try {
            let zone = TimeZone("Asia/Shanghai", Duration.Max)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Invalid offset.")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_init_10(): Unit {
        var flag = false
        try {
            let zone = TimeZone("Asia/Shanghai", Duration.Min)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Invalid offset.")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_init_11(): Unit {
        let zone = TimeZone("Asia/Shanghai", Duration.hour * 25 + Duration.minute * 59 + Duration.second * 59)
        let datetime = DateTime.now(timeZone: zone)
        @Assert(datetime.zoneOffset, Duration.hour * 25 + Duration.minute * 59 + Duration.second * 59)
    }

    @TestCase
    func test_init_12(): Unit {
        let zone = TimeZone("Asia/Shanghai", Duration.hour * -24 + Duration.minute * -59 + Duration.second * -59)
        let datetime = DateTime.now(timeZone: zone)
        @Assert(datetime.zoneOffset, Duration.hour * -24 + Duration.minute * -59 + Duration.second * -59)
    }

    @TestCase
    func test_init_13(): Unit {
        var flag = false
        try {
            let zone = TimeZone("Asia/Shanghai",
                Duration.hour * 25 + Duration.minute * 59 + Duration.second * 59 + Duration.second)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Invalid offset.")
            flag = true
        }
        @Assert(flag, true)
    }

    @TestCase
    func test_init_14(): Unit {
        var flag = false
        try {
            let zone = TimeZone("Asia/Shanghai",
                Duration.hour * -24 + Duration.minute * -59 + Duration.second * -59 - Duration.second)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message, "Invalid offset.")
            flag = true
        }
        @Assert(flag, true)
    }
}
