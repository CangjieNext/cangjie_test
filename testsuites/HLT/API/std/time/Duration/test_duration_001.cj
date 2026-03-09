/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.time.*
import std.collection.*

let MAX_INT64: Int64 = 9_223_372_036_854_775_807
let MIN_INT64: Int64 = -9_223_372_036_854_775_808
let minNanoSecond = MIN_INT64
let minMicrosecond = MIN_INT64 / 1000
let minMillisecond = MIN_INT64 / 1000_000
let minSecond = MIN_INT64
let minMinute = MIN_INT64 / 60
let minHour = MIN_INT64 / 3600
let minDay = MIN_INT64 / 86400
let maxNanoSecond = MAX_INT64
let maxMicrosecond = MAX_INT64 / 1000
let maxMillisecond = MAX_INT64 / 1000_000
let maxSecond = MAX_INT64
let maxMinute = MAX_INT64 / 60
let maxHour = MAX_INT64 / 3600
let maxDay = MAX_INT64 / 86400

@Test
class TestDuration {
    // 验证无参的初始化函数生成的duration默认为1
    @TestCase
    public func testDuration0(): Int64 {
        let constructors0: HashMap<String, Duration> = HashMap<String, Duration>(
            [
                ("nanosecond: ", Duration.nanosecond),
                ("microsecond: ", Duration.microsecond),
                ("millisecond: ", Duration.millisecond),
                ("second: ", Duration.second),
                ("minute: ", Duration.minute),
                ("hour: ", Duration.hour)
            ]
        )

        let constructors1: HashMap<String, (Duration, Array<Int64>)> = HashMap<String, (Duration, Array<Int64>)>(
            [
                ("nanosecond: ", (Duration.nanosecond, [-1, 0])),
                ("microsecond: ", (Duration.microsecond, [-1, 0])),
                ("millisecond: ", (Duration.millisecond, [-1, 0])),
                ("second: ", (Duration.second, [-1, 0])),
                ("minute: ", (Duration.minute, [-1, 0])),
                ("hour: ", (Duration.hour, [-1, 0]))
            ]
        )

        for ((constructorName, constructor) in constructors1) {
            let duration0 = constructor[0] * constructor[1][0]
            let duration1 = constructor[0] * constructor[1][1]
            let duration2 = constructors0[constructorName]
            if (assertEqule("Instance created by ${constructorName}: ", duration1, duration0 + duration2)) {
                return 1
            }
        }
        return 0
    }

    // 验证超过范围的duration生成会抛出异常
    @TestCase
    public func testDuration1(): Int64 {
        var result = 0
        let unit = [Duration.minute, Duration.hour, Duration.day]
        let multipuler1 = [maxMinute, maxHour, maxDay]
        let multipuler2 = [minMinute, minHour, minDay]

        for (i in 0..3) {
            if (testException("Test out of min range:", {=> unit[i] * (multipuler2[i] - 1)})) {
                result = 1
            }
            if (testException("Test out of max range:", {=> unit[i] * (multipuler1[i] + 1)})) {
                result = 1
            }
        }
        return result
    }

    // 验证成员函数的功能正确性
    @TestCase
    public func testDuration2(): Int64 {
        let durationNanoSecond = Duration.nanosecond * (-3600000000000)
        let durationMicroSecond = Duration.microsecond * 3600000000
        let durationMilliSecond = Duration.millisecond * (-3600000)
        let durationSecond = Duration.millisecond * 3600
        let durationMinute = Duration.minute * (-60)
        let durationHour = Duration.hour

        if (assertEqule("Test nanoseconds", durationMilliSecond.toNanoseconds(), durationMinute.toNanoseconds()) ||
            assertEqule("Test microseconds", durationSecond.toMicroseconds(), durationHour.toMicroseconds()) ||
            assertEqule("Test milliseconds", durationNanoSecond.toMilliseconds(), durationMinute.toMilliseconds()) ||
            assertEqule("Test seconds", durationHour.toSeconds(), durationMicroSecond.toSeconds()) || assertEqule(
            "Test minutes", durationMilliSecond.toMinutes(), durationNanoSecond.toMinutes()) || assertEqule(
            "Test hours", durationMicroSecond.toHours(), durationSecond.toHours())) {
            return 1
        }
        return 0
    }

    // 验证运算符重载在运算溢出时能正常抛异常
    @TestCase
    public func testDuration3(): Int64 {
        let nano = Duration.nanosecond * (-1)
        var result = 0
        if (testException("Test operator -", {=> Duration.Max - nano})) {
            result = 1
        }
        if (testException("Test operator -", {=> Duration.Min - Duration.nanosecond})) {
            result = 1
        }
        if (testException("Test operator +", {=> Duration.Max + Duration.nanosecond})) {
            result = 1
        }
        if (testException("Test operator +", {=> Duration.Min + nano})) {
            result = 1
        }
        if (testException("Test operator *", {=> Duration.Max * 2})) {
            result = 1
        }
        if (testException("Test operator *", {=> Duration.Min * (-1)})) {
            result = 1
        }
        if (testException("Test operator /", {=> Duration.Max / 0})) {
            result = 1
        }
        if (testException("Test operator /", {=> Duration.Min / 0})) {
            result = 1
        }

        return result
    }

    // 验证运算符重载计算正确性
    @TestCase
    public func testDuration4(): Int64 {
        let durationNanoSecond = Duration.Zero
        let durationMicroSecond = Duration.microsecond * minMicrosecond
        let durationMilliSecond = Duration.millisecond * maxMillisecond
        let durationSecond = Duration.second
        let durationMinute = Duration.minute * (-1)
        let durationHour = Duration.hour

        var result = 0
        if (assertEqule("Test operator + between second and minute:", Duration.second * (-59),
            durationSecond + durationMinute)) {
            result = 1
        }
        if (assertEqule("Test operator - between hour and minute:", Duration.minute * 61, durationHour - durationMinute)) {
            result = 1
        }
        if (assertEqule("Test operator * between second and hour:", durationHour, durationSecond * 3600)) {
            result = 1
        }
        if (assertEqule("Test operator / between hour and minute:", Float64(-60), durationHour / durationMinute)) {
            result = 1
        }
        if (assertEqule("Test operator / between second and hour:", Float64(-1) / Float64(60),
            durationMinute / durationHour)) {
            result = 1
        }
        if (durationMicroSecond >= durationNanoSecond) {
            print("Test operator >= between MicroSecond and NanoSecond:")
            result = 1
        }
        if (durationMilliSecond <= durationNanoSecond) {
            print("Test operator <= between MilliSecond and NanoSecond:")
            result = 1
        }
        if (durationSecond > durationHour) {
            print("Test operator > between second and hour:")
            result = 1
        }
        if (durationSecond < durationMinute) {
            print("Test operator < between second and minute:")
            result = 1
        }

        return result
    }

    // 验证toString方法的功能正确性
    @TestCase
    public func testDuration5(): Int64 {
        let durationZero = Duration.Zero
        let durationHour = Duration.hour
        let durationMinute = Duration.minute
        let durationSecond = Duration.second
        let durationNanoSecond = Duration.nanosecond
        let durationMicroSecond = Duration.microsecond
        let durationMilliSecond = Duration.millisecond

        var result = 0
        if (assertEqule("Test toString: ", "58m58s998ms998us998ns",
            (durationHour - durationMinute - durationSecond - durationNanoSecond - durationMilliSecond -
                durationMicroSecond - durationNanoSecond).toString())) {
            result = 1
        }
        if (assertEqule("Test toString: ", "-58m58s998ms998us998ns",
            (durationHour * (-1) + durationMinute + durationSecond + durationNanoSecond + durationMilliSecond +
                durationMicroSecond + durationNanoSecond).toString())) {
            result = 1
        }
        return result
    }
}

func testException(msg: String, lambdaExpr: () -> Float64): Bool {
    try {
        lambdaExpr()
    } catch (_) {
        return false
    }
    print(msg + "\n")
    return true
}

func testException(msg: String, lambdaExpr: () -> Duration): Bool {
    try {
        lambdaExpr()
    } catch (_) {
        return false
    }
    print(msg + "\n")
    return true
}

func assertEqule(msg: String, expected: Int64, actual: Int64): Bool {
    if (actual != expected) {
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg: String, expected: Float64, actual: Float64): Bool {
    if (actual != expected) {
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg: String, expected: String, actual: String): Bool {
    if (actual != expected) {
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}

func assertEqule(msg: String, expected: Duration, actual: Duration): Bool {
    if (actual != expected) {
        print(msg + ": the expect is ${expected}, but ths actual is ${actual}\n")
        return true
    }
    return false
}
