/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not Exception
// ASSERT: scan-not Failure

import std.time.*

//@Test
class TestTime {

    // 测试Time构造函数 DateTime.of(sec : Int64, nanoSec : Int64)
    // 通过API data, clock, location, zone, utc, in, toString对生成的Time实例结果进行了验证
    //    @TestCase
    public func testTimeConstructor1(): Int64 {
        print("testTimeConstructor1\n")
        let dateTime = DateTime.ofEpoch(second: 0, nanosecond: 0).inUTC()
        if (assertEqule("验证此构造函数从1970.1.1 UTC开始计算", (dateTime.year, dateTime.month, dateTime.dayOfMonth),
            (1970, January, 1)) || assertEqule("验证此构造函数从1970.1.1 UTC 0h 0m 0s开始计算",
            (dateTime.hour, dateTime.minute, dateTime.second), (0, 0, 0)) || assertEqule(
            "验证此构造函数从1970.1.1 UTC开始计算", dateTime.toString(), "1970-01-01T00:00:00Z")) {
            return 1
        }
        return 0
    }

    // 测试isoWeek，weekDay能否正确计算出正确的日子。
    // 覆盖闰年引起的日期变化，以及年末年初时week变化
    //    @TestCase
    public func testWeekDay(): Int64 {
        print("testWeekDay\n")
        let monday = DateTime.of(year: 1, month: January, dayOfMonth: 1, timeZone: TimeZone.UTC)
        let tuesday = DateTime.of(year: 2, month: January, dayOfMonth: 1, timeZone: TimeZone.UTC)
        let wednesday = DateTime.of(year: 3, month: January, dayOfMonth: 1, timeZone: TimeZone.UTC)
        let thursday = DateTime.of(year: 4, month: January, dayOfMonth: 1, timeZone: TimeZone.UTC)
        let friday = DateTime.of(year: -1, month: January, dayOfMonth: 1, timeZone: TimeZone.UTC)
        let saturday = DateTime.of(year: 0, month: January, dayOfMonth: 1, timeZone: TimeZone.UTC)
        let sunday = DateTime.of(year: 2021, month: June, dayOfMonth: 27, timeZone: TimeZone.UTC)
        if (assertEqule("测试weekDay, 公元1年1月1日，是星期一", Monday, monday.dayOfWeek) || assertEqule(
            "测试weekDay, 公元2年1月1日，是星期二", Tuesday, tuesday.dayOfWeek) || assertEqule(
            "测试weekDay, 公元3年1月1日，是星期三", Wednesday, wednesday.dayOfWeek) || assertEqule(
            "测试weekDay, 公元4年1月1日，是星期四", Thursday, thursday.dayOfWeek) || assertEqule(
            "测试weekDay, 公元-1年1月1日，是星期五", Friday, friday.dayOfWeek) || assertEqule(
            "测试weekDay, 公元0年1月1日，是星期六", Saturday, saturday.dayOfWeek) || assertEqule(
            "测试weekDay, 公元2021年6月27日，是星期日", Sunday, sunday.dayOfWeek)) {
            return 1
        }
        return 0
    }

    // 测试isoWeek能否正确计算出正确的日子。
    // 覆盖闰年引起的日期变化，以及年末年初时week变化
    //    @TestCase
    public func testIsoWeek(): Int64 {
        print("testIsoWeek")
        let week1 = DateTime.of(year: 1, month: January, dayOfMonth: 1, timeZone: TimeZone.UTC)
        let week2 = DateTime.of(year: 0, month: January, dayOfMonth: 2, timeZone: TimeZone.UTC)
        let week3 = DateTime.of(year: 0, month: December, dayOfMonth: 24, timeZone: TimeZone.UTC)
        let week4 = DateTime.of(year: 1, month: December, dayOfMonth: 31, timeZone: TimeZone.UTC)
        if (assertEqule("测试isoweek, 公元1年1月1日，第1周", (1, 1), week1.isoWeek) || assertEqule(
            "测试isoweek, 公元0年1月2日，是第52周", (-1, 52), week2.isoWeek) || assertEqule(
            "测试isoweek, 公元0年12月24日，是第52周", (0, 51), week3.isoWeek) || assertEqule(
            "测试isoweek, 公元1年12月31日，是第53周", (2, 1), week4.isoWeek)) {
            return 1
        }
        return 0
    }

    // 测试yearDay能否正确计算出正确的日子。
    // 覆盖闰年引起的日期变化，以及年末年初时week变化
    //    @TestCase
    public func testYearDay(): Int64 {
        print("testYearDay\n")
        let day1 = DateTime.of(year: 0, month: January, dayOfMonth: 1, timeZone: TimeZone.UTC)
        let day2 = DateTime.of(year: 0, month: December, dayOfMonth: 31, timeZone: TimeZone.UTC)
        let day3 = DateTime.of(year: 100, month: December, dayOfMonth: 31, timeZone: TimeZone.UTC)
        let day4 = DateTime.of(year: 400, month: December, dayOfMonth: 31, timeZone: TimeZone.UTC)
        if (assertEqule("测试yearDay, 公元0年1月1日: ", 1, day1.dayOfYear) || assertEqule(
            "测试yearDay, 公元0年12月31日: ", 366, day2.dayOfYear) || assertEqule("测试yearDay, 公元100年12月31日: ",
            365, day3.dayOfYear) || assertEqule("测试yearDay, 公元400年12月31日: ", 366, day4.dayOfYear)) {
            return 1
        }
        return 0
    }

    // 覆盖超过unixNano函数的取值范围后能够正确抛出异常
    //    @TestCase
    public func testUnixNano(): Int64 {
        print("testUnixNano\n")
        let timeExceed = [(DateTime.ofEpoch(second: -9223372037, nanosecond: 145224192), Duration.nanosecond * (-1)),
            (DateTime.ofEpoch(second: 9223372036, nanosecond: 854775808), Duration.nanosecond)]
        for (time in timeExceed) {
            var timeLimitation = time[0] + time[1]
            try {
                let nanoSecond = timeLimitation.toUnixTimeStamp().toNanoseconds()
            } catch (_) {
                continue
            }
            print("Exceed the unixNano")
            return 1
        }
        return 0
    }

    //    @TestCase
    public func testUnix(): Int64 {
        print("testUnix\n")
        var minTime = DateTime.ofEpoch(second: 0, nanosecond: 0)
        var maxTime = DateTime.ofEpoch(second: 0, nanosecond: 0)
        for (i in 0..1000000000) {
            minTime = minTime + Duration.nanosecond * (-0x8000_0000_0000_0000)
            maxTime = maxTime + Duration.nanosecond * 0x7FFF_FFFF_FFFF_FFFF
        }
        print("minTime: " + minTime.toString() + "\n")
        print("maxTime: " + maxTime.toString() + "\n")
        let timeExceed = [(minTime, Duration.second * (-1)), (maxTime, Duration.second)]
        for (time in timeExceed) {
            var timeLimitation = time[0] + time[1]
            try {
                let second = timeLimitation.toUnixTimeStamp().toSeconds()
                print(second.toString())
            } catch (_) {
                continue
            }
            print("Exceed the unix!")
            return 1
        }
        return 0
    }

    // 测试Time实例加法运算, 覆盖年、月、日的计算自动进位、退位等
    // 部分校验可通过重载的+ -运算符 对结果进行内部校验和计算
    //    @TestCase
    public func testAddDays(): Int64 {
        print("testAddDays\n")
        let day = DateTime.of(year: 0, month: January, dayOfMonth: 1)
        if (assertEqule("测试addDays 1: ", day + Duration.hour * 8784, day.addYears(1)) || assertEqule(
            "测试addDays 2: ", day + Duration.hour * 8784, day.addYears(-1).addMonths(14).addDays(306)) || assertEqule(
            "测试addDays 3: ", day + Duration.hour * 8784, day.addYears(3).addMonths(-12).addDays(-365))) {
            return 1
        }
        return 0
    }
}

func assertEqule(msg: String, expected: Int64, actual: Int64): Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg: String, expected: DateTime, actual: DateTime): Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg: String, expected: String, actual: String): Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg: String, expected: Month, actual: Month): Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg: String, expected: DayOfWeek, actual: DayOfWeek): Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg: String, expected: (Int64, Month, Int64), actual: (Int64, Month, Int64)): Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is different from actual \n")
        return true
    }
    return false
}

func assertEqule(msg: String, expected: (Int64, Int64, Int64), actual: (Int64, Int64, Int64)): Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(
            msg +
                ": the expect is ${expected[0]}:${expected[1]}:${expected[2]}, but the actual is ${actual[0]}:${actual[1]}:${actual[2]}\n")
        return true
    }
    return false
}

func assertEqule(msg: String, expected: (Int64, Int64), actual: (Int64, Int64)): Bool {
    if (actual != expected) {
        print("\nFailure\n")
        print(msg + ": the expect is ${expected[0]} ${expected[1]} , but the actual is ${actual[0]} ${actual[1]}\n")
        return true
    }
    return false
}

main(): Int64 {
    let cases: TestTime = TestTime()

    return cases.testUnixNano() |
        //cases.testUnix() |
        cases.testTimeConstructor1() | cases.testWeekDay() | cases.testIsoWeek() |
        cases.testAddDays()
}
