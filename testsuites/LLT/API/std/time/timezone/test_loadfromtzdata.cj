/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args

import std.time.*
import std.collection.*

public class TZifBuilder {
    public var magic1: ArrayList<UInt8> = ArrayList<UInt8>([84, 90, 105, 102]) // "TZif"
    public var ver1: ArrayList<UInt8> = ArrayList<UInt8>([50]) // (2)
    public var unused1: ArrayList<UInt8> = ArrayList<UInt8>(Array<UInt8>(15, repeat: 0))
    public var isutccnt1: ArrayList<UInt8> = ArrayList<UInt8>([0, 0, 0, 2])
    public var isstdcnt1: ArrayList<UInt8> = ArrayList<UInt8>([0, 0, 0, 2])
    public var isleapcnt1: ArrayList<UInt8> = ArrayList<UInt8>([0, 0, 0, 0])
    public var timecnt1: ArrayList<UInt8> = ArrayList<UInt8>([0, 0, 0, 3])
    public var typecnt1: ArrayList<UInt8> = ArrayList<UInt8>([0, 0, 0, 2])
    public var charcnt1: ArrayList<UInt8> = ArrayList<UInt8>([0, 0, 0, 8])
    public var transtime1_1: ArrayList<UInt8> = ArrayList<UInt8>([128, 0, 0, 0]) // (1901-12-13T20:45:52Z)
    public var transtime1_2: ArrayList<UInt8> = ArrayList<UInt8>([187, 5, 67, 72]) // (1933-04-30T12:30:00Z)
    public var transtime1_3: ArrayList<UInt8> = ArrayList<UInt8>([127, 232, 23, 128]) // (2038-01-01T00:00:00Z)
    public var transtype1_1: ArrayList<UInt8> = ArrayList<UInt8>([0])
    public var transtype1_2: ArrayList<UInt8> = ArrayList<UInt8>([1])
    public var transtype1_3: ArrayList<UInt8> = ArrayList<UInt8>([0])
    public var localtimetype1_1: ArrayList<UInt8> = ArrayList<UInt8>([255, 255, 108, 88, 0, 0]) // (-10:30)
    public var localtimetype1_2: ArrayList<UInt8> = ArrayList<UInt8>([255, 255, 122, 104, 0, 4]) // (-09:30)
    public var designations1_1: ArrayList<UInt8> = ArrayList<UInt8>("LMT\0".toArray())
    public var designations1_2: ArrayList<UInt8> = ArrayList<UInt8>("HST\0".toArray())
    public var local1_1: ArrayList<UInt8> = ArrayList<UInt8>([1])
    public var local1_2: ArrayList<UInt8> = ArrayList<UInt8>([0])
    public var wall1_1: ArrayList<UInt8> = ArrayList<UInt8>([1])
    public var wall1_2: ArrayList<UInt8> = ArrayList<UInt8>([0])
    public var magic2: ArrayList<UInt8> = ArrayList<UInt8>([84, 90, 105, 102]) // "TZif"
    public var ver2: ArrayList<UInt8> = ArrayList<UInt8>([50]) // (2)
    public var unused2: ArrayList<UInt8> = ArrayList<UInt8>(Array<UInt8>(15, repeat: 0))
    public var isutccnt2: ArrayList<UInt8> = ArrayList<UInt8>([0, 0, 0, 2])
    public var isstdcnt2: ArrayList<UInt8> = ArrayList<UInt8>([0, 0, 0, 2])
    public var isleapcnt2: ArrayList<UInt8> = ArrayList<UInt8>([0, 0, 0, 0])
    public var timecnt2: ArrayList<UInt8> = ArrayList<UInt8>([0, 0, 0, 3])
    public var typecnt2: ArrayList<UInt8> = ArrayList<UInt8>([0, 0, 0, 2])
    public var charcnt2: ArrayList<UInt8> = ArrayList<UInt8>([0, 0, 0, 8])
    public var transtime2_1: ArrayList<UInt8> = ArrayList<UInt8>([255, 255, 255, 255, 116, 224, 112, 190]) // (1896-01-13T22:31:26Z)
    public var transtime2_2: ArrayList<UInt8> = ArrayList<UInt8>([255, 255, 255, 255, 187, 5, 67, 72]) // (1933-04-30T12:30:00Z)
    public var transtime2_3: ArrayList<UInt8> = ArrayList<UInt8>([0, 0, 0, 0, 127, 232, 23, 128]) // (2038-01-01T00:00:00Z)
    public var transtype2_1: ArrayList<UInt8> = ArrayList<UInt8>([0])
    public var transtype2_2: ArrayList<UInt8> = ArrayList<UInt8>([1])
    public var transtype2_3: ArrayList<UInt8> = ArrayList<UInt8>([0])
    public var localtimetype2_1: ArrayList<UInt8> = ArrayList<UInt8>([255, 255, 108, 88, 0, 0]) // (-10:30)
    public var localtimetype2_2: ArrayList<UInt8> = ArrayList<UInt8>([255, 255, 122, 104, 0, 4]) // (-09:30)
    public var designations2_1: ArrayList<UInt8> = ArrayList<UInt8>("LMT\0".toArray())
    public var designations2_2: ArrayList<UInt8> = ArrayList<UInt8>("HST\0".toArray())
    public var local2_1: ArrayList<UInt8> = ArrayList<UInt8>([0])
    public var local2_2: ArrayList<UInt8> = ArrayList<UInt8>([0])
    public var wall2_1: ArrayList<UInt8> = ArrayList<UInt8>([0])
    public var wall2_2: ArrayList<UInt8> = ArrayList<UInt8>([0])
    public var footer: ArrayList<UInt8> = ArrayList<UInt8>("\nHST10\n".toArray())

    public func build(): Array<UInt8> {
        var TZif: ArrayList<UInt8> = ArrayList<UInt8>()
        TZif.add(all: magic1)
        TZif.add(all: ver1)
        TZif.add(all: unused1)
        TZif.add(all: isutccnt1)
        TZif.add(all: isstdcnt1)
        TZif.add(all: isleapcnt1)
        TZif.add(all: timecnt1)
        TZif.add(all: typecnt1)
        TZif.add(all: charcnt1)
        TZif.add(all: transtime1_1)
        TZif.add(all: transtime1_2)
        TZif.add(all: transtime1_3)
        TZif.add(all: transtype1_1)
        TZif.add(all: transtype1_2)
        TZif.add(all: transtype1_3)
        TZif.add(all: localtimetype1_1)
        TZif.add(all: localtimetype1_2)
        TZif.add(all: designations1_1)
        TZif.add(all: designations1_2)
        TZif.add(all: local1_1)
        TZif.add(all: local1_2)
        TZif.add(all: wall1_1)
        TZif.add(all: wall1_2)
        TZif.add(all: magic2)
        TZif.add(all: ver2)
        TZif.add(all: unused2)
        TZif.add(all: isutccnt2)
        TZif.add(all: isstdcnt2)
        TZif.add(all: isleapcnt2)
        TZif.add(all: timecnt2)
        TZif.add(all: typecnt2)
        TZif.add(all: charcnt2)
        TZif.add(all: transtime2_1)
        TZif.add(all: transtime2_2)
        TZif.add(all: transtime2_3)
        TZif.add(all: transtype2_1)
        TZif.add(all: transtype2_2)
        TZif.add(all: transtype2_3)
        TZif.add(all: localtimetype2_1)
        TZif.add(all: localtimetype2_2)
        TZif.add(all: designations2_1)
        TZif.add(all: designations2_2)
        TZif.add(all: local2_1)
        TZif.add(all: local2_2)
        TZif.add(all: wall2_1)
        TZif.add(all: wall2_2)
        TZif.add(all: footer)
        return TZif.toArray()
    }
}

func expectResult(timeZone: TZifBuilder, zoneName1: String, offset1: String, zoneName2: String, offset2: String,
    year!: Int64 = 2038) {
    let dateTime1 = DateTime.of(year: year, month: 1, dayOfMonth: 2,
        timeZone: TimeZone.loadFromTZData("Test", timeZone.build()))
    let dateTime2 = DateTime.of(year: year, month: 3, dayOfMonth: 30,
        timeZone: TimeZone.loadFromTZData("Test", timeZone.build()))
    @Expect(dateTime1.format("z"), zoneName1)
    @Expect(dateTime1.format("OO"), offset1)
    @Expect(dateTime2.format("z"), zoneName2)
    @Expect(dateTime2.format("OO"), offset2)
}

@Test
class LoadFromTZDataTest {
    let baseTZif = TZifBuilder().build()
    @TestCase
    func loadFromTZData(): Unit {
        let timeZone = TimeZone.loadFromTZData("abc", baseTZif)
        @Expect(timeZone.toString(), "abc")
        @Expect(timeZone.id, "abc")
        var dateTime = DateTime.of(year: 2037, month: December, dayOfMonth: 31, hour: 14, minute: 30, second: 0,
            nanosecond: 0, timeZone: timeZone)
        @Expect(dateTime.toString(), "2037-12-31T14:30:00-10:00")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "abc")
        @Expect(dateTime.zoneOffset, - 10 * Duration.hour)

        dateTime = DateTime.of(year: 2037, month: December, dayOfMonth: 31, hour: 14, minute: 29, second: 59,
            nanosecond: 999999999, timeZone: timeZone)
        @Expect(dateTime.toString(), "2037-12-31T14:29:59.999999999-09:30")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "abc")
        @Expect(dateTime.zoneOffset, - 9 * Duration.hour - 30 * Duration.minute)

        dateTime = DateTime.of(year: 1933, month: April, dayOfMonth: 30, hour: 3, minute: 0, second: 0, nanosecond: 0,
            timeZone: timeZone)
        @Expect(dateTime.toString(), "1933-04-30T03:00:00-09:30")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "abc")
        @Expect(dateTime.zoneOffset, - 9 * Duration.hour - 30 * Duration.minute)

        dateTime = DateTime.of(year: 1933, month: April, dayOfMonth: 30, hour: 2, minute: 59, second: 59,
            nanosecond: 999999999, timeZone: timeZone)
        @Expect(dateTime.toString(), "1933-04-30T03:59:59.999999999-09:30")

        dateTime = DateTime.of(year: 1896, month: January, dayOfMonth: 13, hour: 12, minute: 1, second: 26,
            nanosecond: 0, timeZone: timeZone)
        @Expect(dateTime.toString(), "1896-01-13T12:01:26-10:30")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "abc")
        @Expect(dateTime.zoneOffset, - 10 * Duration.hour - 30 * Duration.minute)

        dateTime = DateTime.of(year: 1896, month: January, dayOfMonth: 13, hour: 12, minute: 1, second: 25,
            nanosecond: 999999999, timeZone: timeZone)
        @Expect(dateTime.toString(), "1896-01-13T12:01:25.999999999-10:30")
        @Expect(dateTime.zone, timeZone)
        @Expect(dateTime.zoneId, "abc")
        @Expect(dateTime.zoneOffset, - 10 * Duration.hour - 30 * Duration.minute)
    }

    @TestCase
    func checkInputForloadFromTZData(): Unit {
        try {
            TimeZone.loadFromTZData("", baseTZif)
            @Expect(false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Invalid timezone id"))
        }

        let testArr: Array<UInt8> = [0, 12, 20, 127, 128, 255]
        for (i in 0..baseTZif.size) {
            for (num in testArr) {
                var tempTZif = baseTZif.clone()
                tempTZif[i] = num
                try {
                    TimeZone.loadFromTZData("abc", tempTZif)
                } catch (e: Exception) {
                    @Expect(e.message.contains("Failed to parse the timezone file"), true)
                }
            }
        }
    }

    @TestCase
    func loadFromTZDataForDST(): Unit {
        // datetime before the first transition time, the transition is to a daylight time
        var timeZone = TZifBuilder()
        timeZone.localtimetype2_2 = ArrayList<UInt8>([255, 255, 122, 104, 1, 4]) // (-09:30) DST
        timeZone.transtype2_1 = ArrayList<UInt8>([1])
        var dateTime = DateTime.of(year: 1896, month: 1, dayOfMonth: 12,
            timeZone: TimeZone.loadFromTZData("Test", timeZone.build()))
        @Expect(dateTime.zoneId, "Test")
        @Expect(dateTime.zoneOffset.toSeconds(), -37800)

        timeZone = TZifBuilder()
        timeZone.localtimetype2_1 = ArrayList<UInt8>([255, 255, 108, 88, 1, 0]) // (-10:30) DST
        timeZone.localtimetype2_2 = ArrayList<UInt8>([255, 255, 122, 104, 1, 4]) // (-09:30) DST
        dateTime = DateTime.of(year: 1896, month: 1, dayOfMonth: 12,
            timeZone: TimeZone.loadFromTZData("Test", timeZone.build()))
        @Expect(dateTime.zoneId, "Test")
        @Expect(dateTime.zoneOffset.toSeconds(), -37800)
    }

    @TestCase
    func NormalFooterParse(): Unit {
        let timeZone = TZifBuilder()
        // HST-10:00 for normal time
        // HDST-09:00 for Daylight saving time start at 01:00 on 2nd day and end in 02:59 on 100th day, exclude leap-day
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,J2/1,J100/3\n".toArray())
        expectResult(timeZone, "HST", "-10:00", "HDST", "-09:00")
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,M1.1.0/00:00:00,M7.1.0/01:00:00\n".toArray())
        expectResult(timeZone, "HST", "-10:00", "HDST", "-09:00")
        // HDST-09:00 for Daylight saving time start at 00:00 on 3rd day and end in 01:00 on 100th day, include leap-day
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,3/00:00:00,100/01:00:00\n".toArray())
        expectResult(timeZone, "HST", "-10:00", "HDST", "-09:00")
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,M1.1.6,M4.5.1\n".toArray())
        expectResult(timeZone, "HST", "-10:00", "HDST", "-09:00", year: 2040)

        timeZone.footer = ArrayList<UInt8>("\nHST-10:00HDST-11:00:00\n".toArray())
        expectResult(timeZone, "HST", "+10:00", "HDST", "+11:00")

        timeZone.footer = ArrayList<UInt8>("\nHST+10:00HDST+9:00\n".toArray())
        expectResult(timeZone, "HST", "-10:00", "HDST", "-09:00")

        timeZone.footer = ArrayList<UInt8>("\nABCDEFG\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")

        timeZone.footer = ArrayList<UInt8>("\n<HST10\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")

        // test leap year
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,J2/1,J100/3\n".toArray())
        expectResult(timeZone, "HST", "-10:00", "HDST", "-09:00", year: 2040)
    }

    @TestCase
    func WrongFooterParse(): Unit {
        let timeZone = TZifBuilder()
        // illegal name
        timeZone.footer = ArrayList<UInt8>("\n1\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        timeZone.footer = ArrayList<UInt8>("\nH\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // std must have offset
        timeZone.footer = ArrayList<UInt8>("\nHST\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // hour must be in [0, 24]
        timeZone.footer = ArrayList<UInt8>("\nHST25\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // minute must be in [0, 59]
        timeZone.footer = ArrayList<UInt8>("\nHST24:60\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // second must be in [0, 59]
        timeZone.footer = ArrayList<UInt8>("\nHST24:59:60\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")

        // wrong TZrule
        // unknow A
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9A\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // lack of TZrule
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // no day
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,J\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // day must be number
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,Jn\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // JulianDay should be in [1, 365]
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,J366\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // dayOfYear must be in [0, 365]
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,366\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // start hour must in [0, 24]
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,J1/-9\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // lack of end
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,J2/1\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // lack of week
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,M1\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // week must be in [1, 5]
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,M1.6\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // lack pf dayOfWeek
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,M1.1\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // dayOfWeek must be in [0, 6]
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,M1.1.7\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
        // extra characters
        timeZone.footer = ArrayList<UInt8>("\nHST10HDST9,J2/1,J100/3abc\n".toArray())
        expectResult(timeZone, "LMT", "-10:30", "LMT", "-10:30")
    }
}
