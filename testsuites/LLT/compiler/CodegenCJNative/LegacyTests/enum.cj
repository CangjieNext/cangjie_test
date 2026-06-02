// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

enum TimeUnit {
    Year | Month | Day | Hour
}

var time1 = Day2(1, 2, 3)

enum TimeUnit2 {
    Year2(Int32)
    | Month2(Int32, Int32)
    | Day2(Int32, Int32, Int32)
}

enum TimeUnit3 {
    Year3(Int32)
    | Month3(Int32, Int32)
}

class A {
    public var a: TimeUnit4 = TimeUnit4.Year
}

func p() {}

var time = TimeUnit2.Day2(1, 2, 3)

func codegenUnitTest(): TimeUnit {
    var time = TimeUnit.Day
    var time2_1 = TimeUnit3.Year3(1)
    var time2_2 = TimeUnit3.Month3(1, 2)
    var time3: A = A()
    time3.a = TimeUnit4.Month(1)
    var time4: TimeUnit4 = TimeUnit4.Year
    match (time4) {
        case Year => ()
        case Month(a) => p()
    }
    return time
}

enum TimeUnit4 {
    Year
    | Month(Int32)
}

enum Time {
    D
}

var t = Time.D
var res: Int32 = match (t) {
    case D => 2
}

main(): Int64 {
    var ret = codegenUnitTest()
    match (ret) {
        case Day => return 0
        case _ => return -1
    }
}
