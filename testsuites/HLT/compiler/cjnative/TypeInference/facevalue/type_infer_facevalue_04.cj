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
// var e = #{1: "Aa", 2: "Bb", 3: "Cc"}    // B103 不支持map类型
var f = 2..3 : 1
var g = {x: Int32, y: Int32 => return x + y}
//  var h = [1,2,3].toArray() B103 成功
var h = [1, 2, 3]
var i = (3.14, "PIE")

func foo<T>(x: T): T {
    return x
}

main(): Int64 {
    var res1 = foo<Rune>(a)
    var res1_1 = foo<Rune>(r'a')
    var res2 = foo<String>(b)
    var res2_1 = foo<String>("hello")
    var res3 = foo<String>(b1)
    var res3_1 = foo<String>("""
hi""")
    var res4 = foo<String>(b2)
    var res5 = foo<Bool>(c)
    var res5_1 = foo<Bool>(true)

    var res6 = foo<Unit>(d)
    var res6_1 = foo<Unit>(())

    //    var range = foo<Range<Int64>>(f)     B103 不支持Range<T>声明
    //    var res7 = 0
    //    for i in f:
    //        res7 = res7 + i

    var res8 = foo<(Int32, Int32) -> Int32>(g)(2, 3)
    var res8_1 = foo<(Int32, Int32) -> Int32>({x: Int32, y: Int32 => return x + y})(2, 3)

    var array = foo<Array<Int64>>(h)
    var array1 = foo<Array<Int64>>([1, 2, 3])
    var res9 = array.size
    var res9_1 = array1.size

    var tp = foo<(Float64, String)>(i)
    var tp1 = foo<(Float64, String)>((3.14, "PIE"))
    var res10 = tp[0]
    var res10_1 = tp1[0]

    if (res1 == r'a' && res2 == "hello" && res3 == "hi" && res4 == "world\\n" && res5 && res6 == () && res8 == 5 &&
        res9 == 3 && res10 == 3.14 && res1_1 == r'a' && res2_1 == "hello" && res3_1 == "hi" && res5_1 && res6_1 == () &&
        res8_1 == 5 && res9_1 == 3 && res10_1 == 3.14) {
        return 0
    }
    return 1
}
