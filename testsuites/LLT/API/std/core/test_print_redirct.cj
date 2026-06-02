/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./expect.txt
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 > output.txt
// EXEC: %diff expect.txt output.txt

func testPrint(): Unit {
    //test string
    var str = "aaabbb"
    print(str, flush: false)
    println()
    println(str)
    //test subString
    print("abc"[0..1], flush: false)
    println("abc"[1..2])
    //test toString
    var array: Array<Int64> = [1]
    print(array)
    println(array)
    //test bool
    var bool = true
    print(bool, flush: false)
    print(bool, flush: true)
    println(bool)
    //test char
    var char = 'a'
    print(char, flush: false)
    print(char, flush: true)
    println(char)
    var c = '\u{128}'
    println(c)
    c = '\u{65536}'
    println(c)
    //test float
    var f1: Float16 = 3.14
    var f2: Float32 = 3.14
    var f3: Float64 = 3.14
    print(f1, flush: false)
    println(f1)
    print(f2, flush: false)
    println(f2)
    print(f3, flush: false)
    println(f3)
    //test int
    var num1: Int8 = 1
    var num2: Int16 = 10
    var num3: Int32 = 100
    var num4: Int64 = 1000
    var num5: UInt8 = 1
    var num6: UInt16 = 10
    var num7: UInt32 = 100
    var num8: UInt64 = 1000
    print(num1, flush: false)
    print(num2, flush: false)
    print(num3, flush: false)
    print(num4, flush: false)
    print(num5, flush: false)
    print(num6, flush: false)
    print(num7, flush: false)
    print(num8, flush: false)
    print(num1, flush: true)
    print(num2, flush: true)
    print(num3, flush: true)
    print(num4, flush: true)
    print(num5, flush: true)
    print(num6, flush: true)
    print(num7, flush: true)
    print(num8, flush: true)
    println(num1)
    println(num2)
    println(num3)
    println(num4)
    println(num5)
    println(num6)
    println(num7)
    println(num8)

    // test rune
    println(r'\u{80}')
    println(r'\u{800}')
    println(r'\u{10000}')
    println(r'䉸')

    str = "仓颉编程语言是一款面向全场景智能的新一代编程语言，主打原生智能化、天生全场景、高性能、强安全。"
    println(str)
}

main() {
    testPrint()
}
