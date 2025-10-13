/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var a = r'a'
var b = "hello"
var b1 = """
hi"""
var b2 = #"world\n"#
var c = true
var d = ()
//  var e = #{1: "Aa", 2: "Bb", 3: "Cc"}    B103 不支持map类型
var f = 2..3 : 1
var g = {x: Int32, y: Int32 => return x + y}
var h = [1, 2, 3]
var i = (3.14, "PIE")

class Student<T> {
    public var stu: T
    public init(x: T, y: Int32) {
        stu = x
    }
}

struct Teacher<T> {
    public var th: T
    public init(x: T, y: Int32) {
        th = x
    }
}

func run1(): Int64 {
    var res1 = Student<Rune>(a, 2).stu
    var res2 = Student<String>(b, 2).stu
    var res3 = Student<String>(b1, 2).stu
    var res4 = Student<String>(b2, 2).stu
    var res5 = Student<Bool>(c, 2).stu
    var res6 = Student<Unit>(d, 2).stu

    //    var range = Student<Range<Int64>>(f, 2).stu     B103 不支持Range<T>声明
    //    var res7 = 0
    //    for i in f:
    var res8 = Student<(Int32, Int32) -> Int32>(g, 2).stu(2, 3)

    var array = Student<Array<Int64>>(h, 2).stu
    var res9 = array.size

    var tp = Student<(Float64, String)>(i, 2).stu
    var res10 = tp[0]

    if (res1 == r'a' && res2 == "hello" && res3 == "hi" && res4 == "world\\n" && res5 && res6 == () && res8 == 5 &&
        res9 == 3 && res10 == 3.14) {
        return 0
    }
    return 1
}

func run2(): Int64 {
    var res1 = Teacher<Rune>(a, 2).th
    var res2 = Teacher<String>(b, 2).th
    var res3 = Teacher<String>(b1, 2).th
    var res4 = Teacher<String>(b2, 2).th
    var res5 = Teacher<Bool>(c, 2).th
    var res6 = Teacher<Unit>(d, 2).th

    //    var range = Teacher<Range<Int64>>(f, 2).th     B103 不支持Range<T>声明
    //    var res7 = 0
    //    for i in f:
    var res8 = Teacher<(Int32, Int32) -> Int32>(g, 2).th(2, 3)

    var array = Teacher<Array<Int64>>(h, 2).th
    var res9 = array.size

    var tp = Teacher<(Float64, String)>(i, 2).th
    var res10 = tp[0]

    if (res1 == r'a' && res2 == "hello" && res3 == "hi" && res4 == "world\\n" && res5 && res6 == () && res8 == 5 &&
        res9 == 3 && res10 == 3.14) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run1() + run2()
}
