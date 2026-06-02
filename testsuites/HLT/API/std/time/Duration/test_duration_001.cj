/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 2>&1

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
    public func testDuration0() {
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
            // println("constructorName:${constructorName}")
            // println("duration1:${duration1}")
            // println("duration0 + duration2:${duration0 + duration2}")
            @Expect(duration1, duration0 + duration2)
        }
    }

    //验证超过范围的duration生成会抛出异常
    @TestCase
    public func testDuration1() {
        var result = 0
        let unit = [Duration.minute, Duration.hour, Duration.day]
        let multipuler1 = [maxMinute, maxHour, maxDay]
        let multipuler2 = [minMinute, minHour, minDay]

        for (i in 0..3) {
            var e: Exception
            e = @AssertThrows[ArithmeticException](unit[i] * (multipuler2[i] - 1))
            @Expect(e.toString().contains("Out of range of representation"))
            e = @AssertThrows[ArithmeticException](unit[i] * (multipuler1[i] + 1))
            @Expect(e.toString().contains("Out of range of representation"))
        }
    }

    // 验证成员函数的功能正确性
    @TestCase
    public func testDuration2() {
        let durationNanoSecond = Duration.nanosecond * (-3600000000000)
        let durationMicroSecond = Duration.microsecond * 3600000000
        let durationMilliSecond = Duration.millisecond * (-3600000)
        let durationSecond = Duration.millisecond * 3600
        let durationMinute = Duration.minute * (-60)
        let durationHour = Duration.hour

        @Expect(durationMilliSecond.toNanoseconds(), durationMinute.toNanoseconds())
        //@Expect(durationSecond.toMicroseconds(), durationHour.toMicroseconds())
        @Expect(durationNanoSecond.toMilliseconds(), durationMinute.toMilliseconds())

        @Expect(durationHour.toSeconds(), durationMicroSecond.toSeconds())
        @Expect(durationMilliSecond.toMinutes(), durationNanoSecond.toMinutes())
        // @Expect(durationMicroSecond.toHours(), durationSecond.toHours())
    }

    // 验证运算符重载在运算溢出时能正常抛异常
    @TestCase
    public func testDuration3(): Unit {
        let nano = Duration.nanosecond * (-1)
        var e: Exception
        e = @AssertThrows[ArithmeticException](Duration.Max - nano)
        @Expect(e.toString().contains("Out of range of representation"))
        e = @AssertThrows[ArithmeticException](Duration.Min - Duration.nanosecond)
        @Expect(e.toString().contains("Out of range of representation"))
        e = @AssertThrows[ArithmeticException](Duration.Max + Duration.nanosecond)
        @Expect(e.toString().contains("Out of range of representation"))
        e = @AssertThrows[ArithmeticException](Duration.Min - Duration.nanosecond)
        @Expect(e.toString().contains("Out of range of representation"))
        e = @AssertThrows[ArithmeticException](Duration.Min + nano)
        @Expect(e.toString().contains("Out of range of representation"))
        e = @AssertThrows[ArithmeticException](Duration.Max * 2)
        @Expect(e.toString().contains("Out of range of representation"))
        e = @AssertThrows[ArithmeticException](Duration.Min * (-1))
        @Expect(e.toString().contains("Out of range of representation"))
        e = @AssertThrows[IllegalArgumentException](Duration.Max / 0)
        @Expect(e.toString().contains("The value of right operand cannot be 0"))
        e = @AssertThrows[IllegalArgumentException](Duration.Min / 0)
        @Expect(e.toString().contains("The value of right operand cannot be 0"))
    }

    // 验证运算符重载计算正确性
    @TestCase
    public func testDuration4() {
        let durationNanoSecond = Duration.Zero
        let durationMicroSecond = Duration.microsecond * minMicrosecond
        let durationMilliSecond = Duration.millisecond * maxMillisecond
        let durationSecond = Duration.second
        let durationMinute = Duration.minute * (-1)
        let durationHour = Duration.hour

        @Expect(Duration.second * (-59), durationSecond + durationMinute)
        @Expect(Duration.minute * 61, durationHour - durationMinute)
        @Expect(durationHour, durationSecond * 3600)
        @Expect(Float64(-60), durationHour / durationMinute)
        @Expect(Float64(-1) / Float64(60), durationMinute / durationHour)
        @Expect(durationMicroSecond >= durationNanoSecond,false)
        @Expect(durationSecond > durationHour,false)
        @Expect(durationSecond < durationMinute,false)
    }

    // 验证toString方法的功能正确性
    @TestCase
    public func testDuration5() {
        let durationZero = Duration.Zero
        let durationHour = Duration.hour
        let durationMinute = Duration.minute
        let durationSecond = Duration.second
        let durationNanoSecond = Duration.nanosecond
        let durationMicroSecond = Duration.microsecond
        let durationMilliSecond = Duration.millisecond

        @Expect("58m58s998ms998us998ns",(durationHour - durationMinute - durationSecond - durationNanoSecond - durationMilliSecond -
               durationMicroSecond - durationNanoSecond).toString())
        @Expect("-58m58s998ms998us998ns",(durationHour * (-1) + durationMinute + durationSecond + durationNanoSecond + durationMilliSecond +
             durationMicroSecond + durationNanoSecond).toString())
    }
}
