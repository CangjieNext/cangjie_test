/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not Exception
// ASSERT: scan-not Failure

import std.time.*

func assertEqual(msg: String, actual: String, expected: String): Bool {
    if (actual != expected) {
        print(msg + "Failure\nexpect: ${expected}\nresult: ${actual}\n")
        return true
    }
    return false
}

func assertEqual(msg: String, actual: Duration, expected: Duration): Bool {
    if (actual != expected) {
        print(msg + "Failure\nexpect: ${expected}\nresult: ${actual}\n")
        return true
    }
    return false
}

func assertEqual(msg: String, actual: Bool, expected: Bool): Bool {
    if (actual != expected) {
        print(msg + "Failure\nexpect: ${expected}\nresult: ${actual}\n")
        return true
    }
    return false
}

class TestTime {
    //跨年，跨月，跨日，跨时，跨分，跨秒
    public let times:Array<(String, String, String)> = [("跨年", "1800-12-31T23:59:59Z", "1801-01-01T00:00:00Z"),
        ("跨月", "1800-11-30T23:59:59Z", "1800-12-01T00:00:00Z"), ("跨日", "1800-11-20T23:59:59Z", "1800-11-21T00:00:00Z"),
        ("跨时", "1800-11-20T22:59:59Z", "1800-11-20T23:00:00Z"), ("跨分", "1800-11-20T22:58:59Z", "1800-11-20T22:59:00Z")]
    public let time1: (String, String, String) = ("跨秒", "1800-11-20T22:58:40Z", "1800-11-20T22:58:41Z")
    public let time2: (String, String, String) = ("==", "1800-11-20T22:58:41Z", "1800-11-20T22:58:41Z")
    // test operator +
    // @TestCase
    public func testTimeOperator1(): Int64 {
        println("Operator1:+")
        for (time in times) {
            if (assertEqual("+之后计算结果${time[0]}", (DateTime.parse(time[1]) + Duration.second).toString(), time[2])) {
                return 1
            }
        }
        if (assertEqual("+之后计算结果${time1[0]}", (DateTime.parse(time1[1]) + Duration.millisecond * 1000).toString(),
            time1[2])) {
            return 2
        }
        return 0
    }
    // test operator -
    // @TestCase
    public func testTimeOperator2(): Int64 {
        println("Operator2:-")
        for (time in times) {
            if (assertEqual("-之后计算结果${time[0]}", (DateTime.parse(time[2]) - DateTime.parse(time[1])),
                Duration.second)) {
                return 1
            }
        }
        if (assertEqual("-之后计算结果${time1[0]}", (DateTime.parse(time1[2]) - DateTime.parse(time1[1])),
            Duration.millisecond * 1000)) {
            return 2
        }
        return 0
    }
    // test operator ==
    // @TestCase
    public func testTimeOperator3(): Int64 {
        println("Operator3:==")
        if (assertEqual("==之后计算结果", DateTime.parse(time1[1]) == DateTime.parse(time1[2]), false) || assertEqual(
            "==之后计算结果", DateTime.parse(time2[1]) == DateTime.parse(time2[2]), true)) {
            return 1
        }
        return 0
    }
    // test operator !=
    // @TestCase
    public func testTimeOperator4(): Int64 {
        println("Operator4:!=")
        if (assertEqual("!=之后计算结果", DateTime.parse(time1[1]) != DateTime.parse(time1[2]), true) || assertEqual(
            "!=之后计算结果", DateTime.parse(time2[1]) != DateTime.parse(time2[2]), false)) {
            return 1
        }
        return 0
    }
    // test operator >=
    // @TestCase
    public func testTimeOperator5(): Int64 {
        println("Operator5:>=")
        if (assertEqual(">=之后计算结果", DateTime.parse(time1[2]) >= DateTime.parse(time1[1]), true) || assertEqual(
            ">=之后计算结果", DateTime.parse(time1[1]) >= DateTime.parse(time1[2]), false) || assertEqual(
            ">=之后计算结果", DateTime.parse(time2[2]) >= DateTime.parse(time2[1]), true)) {
            return 1
        }
        return 0
    }
    // test operator >
    // @TestCase
    public func testTimeOperator6(): Int64 {
        println("Operator6:>")
        if (assertEqual(">之后计算结果", DateTime.parse(time1[2]) > DateTime.parse(time1[1]), true) || assertEqual(
            ">之后计算结果", DateTime.parse(time1[1]) > DateTime.parse(time1[2]), false) || assertEqual(">之后计算结果",
            DateTime.parse(time2[2]) > DateTime.parse(time2[1]), false)) {
            return 1
        }
        return 0
    }
    // test operator <=
    // @TestCase
    public func testTimeOperator7(): Int64 {
        println("Operator7:<=")
        if (assertEqual("<=之后计算结果", DateTime.parse(time1[2]) <= DateTime.parse(time1[1]), false) || assertEqual(
            "<=之后计算结果", DateTime.parse(time1[1]) <= DateTime.parse(time1[2]), true) || assertEqual(
            "<=之后计算结果", DateTime.parse(time2[2]) <= DateTime.parse(time2[1]), true)) {
            return 1
        }
        return 0
    }
    // test operator <
    // @TestCase
    public func testTimeOperator8(): Int64 {
        println("Operator8:<")
        if (assertEqual("<之后计算结果", DateTime.parse(time1[2]) < DateTime.parse(time1[1]), false) || assertEqual(
            "<之后计算结果", DateTime.parse(time1[1]) < DateTime.parse(time1[2]), true) || assertEqual("<之后计算结果",
            DateTime.parse(time2[2]) < DateTime.parse(time2[1]), false)) {
            return 1
        }
        return 0
    }
}

main(): Int64 {
    let cases: TestTime = TestTime()
    if (cases.testTimeOperator1() != 0) {
        return 1
    }
    if (cases.testTimeOperator2() != 0) {
        return 2
    }
    if (cases.testTimeOperator3() != 0) {
        return 3
    }
    if (cases.testTimeOperator4() != 0) {
        return 4
    }
    if (cases.testTimeOperator5() != 0) {
        return 5
    }
    if (cases.testTimeOperator6() != 0) {
        return 6
    }
    if (cases.testTimeOperator7() != 0) {
        return 7
    }
    if (cases.testTimeOperator8() != 0) {
        return 8
    }
    return 0
}
