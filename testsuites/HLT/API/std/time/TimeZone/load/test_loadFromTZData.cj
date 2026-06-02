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

let mydata: Array<UInt8> = [84, 90, 105, 102, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 4, 0,
    0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 4, 0, 0, 0, 18, 128, 0, 0, 0, 134, 171, 112, 209, 140, 80, 96, 0, 150, 170, 67, 209,
    161, 81, 239, 120, 0, 1, 0, 2, 3, 0, 0, 3, 47, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 7, 8, 0, 8, 0, 0, 14, 16, 0, 14, 76, 77,
    84, 0, 71, 77, 84, 0, 43, 48, 48, 51, 48, 0, 87, 65, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 84, 90, 105, 102, 50, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 4, 0, 0, 0, 18, 248, 0, 0,
    0, 0, 0, 0, 0, 255, 255, 255, 255, 134, 171, 112, 209, 255, 255, 255, 255, 140, 80, 96, 0, 255, 255, 255, 255, 150,
    170, 67, 209, 255, 255, 255, 255, 161, 81, 239, 120, 0, 1, 0, 2, 3, 0, 0, 3, 47, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 7, 8,
    0, 8, 0, 0, 14, 16, 0, 14, 76, 77, 84, 0, 71, 77, 84, 0, 43, 48, 48, 51, 48, 0, 87, 65, 84, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 10, 87, 65, 84, 45, 49, 10, 0]
let errdata1: Array<UInt8> = [0, 90, 105, 102, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 4,
    0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 4, 0, 0, 0, 18, 128, 0, 0, 0, 134, 171, 112, 209, 140, 80, 96, 0, 150, 170, 67, 209,
    161, 81, 239, 120, 0, 1, 0, 2, 3, 0, 0, 3, 47, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 7, 8, 0, 8, 0, 0, 14, 16, 0, 14, 76, 77,
    84, 0, 71, 77, 84, 0, 43, 48, 48, 51, 48, 0, 87, 65, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 84, 90, 105, 102, 50, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 4, 0, 0, 0, 18, 248, 0, 0,
    0, 0, 0, 0, 0, 255, 255, 255, 255, 134, 171, 112, 209, 255, 255, 255, 255, 140, 80, 96, 0, 255, 255, 255, 255, 150,
    170, 67, 209, 255, 255, 255, 255, 161, 81, 239, 120, 0, 1, 0, 2, 3, 0, 0, 3, 47, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 7, 8,
    0, 8, 0, 0, 14, 16, 0, 14, 76, 77, 84, 0, 71, 77, 84, 0, 43, 48, 48, 51, 48, 0, 87, 65, 84, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 10, 87, 65, 84, 45, 49, 10, 0]
let errdata2: Array<UInt8> = [0]

@Test
class Test_loadFromTZData {
    @TestCase
    func test_loadFromTZData_success(): Unit {
        let zone = TimeZone.loadFromTZData("me", mydata)
        let datetime = DateTime.now(timeZone: zone)
        @Expect(datetime.zoneOffset, Duration.hour * 1)
        @Expect(zone.id, "me")
    }

    @TestCase
    func test_loadFromTZData_01(): Unit {
        var flag = false
        try {
            let zone = TimeZone.loadFromTZData("", mydata)
        } catch (e: IllegalArgumentException) {
            flag = true
            @Expect(e.message.contains("Invalid timezone id"))
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_loadFromTZData_02(): Unit {
        let zone1 = TimeZone.UTC
        let zone2 = TimeZone.loadFromTZData("UTC", mydata)

        let datetime1 = DateTime.now(timeZone: zone1)
        @Expect(datetime1.zoneOffset, Duration.Zero)
        @Expect(zone1.id, "UTC")

        let datetime2 = DateTime.now(timeZone: zone2)
        @Expect(datetime2.zoneOffset, Duration.hour * 1)
        @Expect(zone2.id, "UTC")

        let res = zone1 == zone2
        @Expect(res, false)
    }

    @TestCase
    func test_loadFromTZData_03(): Unit {
        var flag = false
        try {
            let zone = TimeZone.loadFromTZData("UTC", errdata1)
        } catch (e: InvalidDataException) {
            flag = true
            @Expect(e.message, "Failed to parse the timezone file.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func test_loadFromTZData_04(): Unit {
        var flag = false
        try {
            let zone = TimeZone.loadFromTZData("UTC", errdata2)
        } catch (e: InvalidDataException) {
            flag = true
            @Expect(e.message, "Failed to parse the timezone file.")
        }
        @Expect(flag, true)
    }
}
