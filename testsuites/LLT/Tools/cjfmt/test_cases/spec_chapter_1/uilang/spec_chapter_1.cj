// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 1.1 标识符
func  id() {
    var abc = 1
    var _abc = 1
    var abc_ = 1
    var a1b2c3 = 1
    var a_b_c = 1
    var a1_b2_c3 = 1
    var 仓颉 = 1
    var __こんにちは = 1

    var `abc` = 1
    var `_abc` = 1
    var `a1b2c3` = 1
    var `if` = 1
    var `while` = 1
    var `à֮̅̕b` = 1
}

// 1.3.1 整数类型字面量
func  int1() {
    let x: Int8 = 128
    let y: UInt8 = 256
    let z: Int32 = 0x8000_0000

    var x = 100i8
    var y = 0x10u64
    var z = 0o432i32
}

// 1.3.2浮点类型字面量
func  float() {
    let a: Float32 = 3.14
    let b: Float32 = 2e3
    let c: Float32 = 2.4e-1
    let d: Float64 = .123e2
    let e: Float64 = 0x1.1p0
    let f: Float64 = 0x1p2
    let g: Float64 = 0x.2p4

    let a = 3.14f32
    let c = 2.4e-1f64
    let d = .123e2f64
}

// 1.3.3 布尔类型字面量
func  bool() {
    let a: Bool = true
    let b: Bool = false
}

// 1.3.4 字符字节字面量
func  str1() {
    var a = b'x'
    var b = b'\n'
    var c = b'\u{78}'
}

// 1.3.4 字符串字面量
func  str2() {
    let s1: String = ""
    let s2 = 'Hello Cangjie Lang'
    let s3 = "\"Hello Cangjie Lang\""
    let s4 = 'Hello Cangjie Lang\n'

    let s5: String = """
        """
    let s6 = '''
        Hello,
        Cangjie Lang'''

    let s7: String = #""#
    let s8 = ##'\n'##
    let s9 = ###"
        Hello,
        Cangjie
        Lang"###

    var b: Byte = "0"
    print(b)
    b = "1"
    print(b)
    var r: Rune = "0"
    print(r)
    r = "1"
    print(r)

    let fruit = "apples"
    let count = 10
    let s = "There are ${count * count} ${fruit}"
    println(s)

    let r = 2.4
    let area = "The area of a circle with radius ${r} is ${let PI = 3.141592; PI * r * r}"
    println(area)

    let s11 = "abc"
    var s21 = "ABC"
    let r11 = s11 == s21
    println("The result of 'abc' == 'ABC' is: ${r11}")
    let r21 = s11 + s21
    println("The result of 'abc' + 'ABC' is: ${r21}")
}

// 1.3.5 字符类型字面量
func  rune() {
    let a: Rune = r'a'
    let b: Rune = r"b"

    let slash: Rune = r'\\'
    let newLine: Rune = r'\n'
    let tab: Rune = r'\t'

    let he: Rune = r'\u{4f60}'
    let llo: Rune = r'\u{597d}'
}

// 1.4 赋值操作符
func  op1() {
    var a: Int64
    var b: Int64
    (a, b) = (1, 2)
    (a, b) = (b, a)
    (a, _) = (3, 4)
    (_, _) = (5, 6)
    return 0
}

// 1.4 算数操作符
func  op2() {
    let num1: Int64 = 8
    let num2 = -num1
    let num3 = -(-num1)

    let a = 2 + 3
    let b = 3 - 1
    let c = 3 * 4
    let d = 7 / 3
    let e = 4 % 3

    let s1 = "abc"
    var s2 = "ABC"
    let r1 = s1 + s2

    let p1 = 2 ** 3
    let p2 = 2 ** UInt64(3 ** 2)
    let p3 = 2.0 ** 3
    let p4 = 2.0 ** 3 ** 2
    let p5 = 2.0 ** 3.0
    let p6 = 2.0 ** 3.0 ** 2.0

    var a: Int64 = 10
    a += 2
    a -= 2
    a **= 2
    a *= 2
    a /= 10
    a %= 6
    a <<= 2

    3 < 4
    3 <= 3
    3 > 4
    3 >= 3
    3.14 == 3.15
    3.14 != 3.15

    var isTrue: Bool = (1, 3) == (0 , 2)
    isTrue = (1, "123") == (1.0, 2)

    let v1 = Option<Int64>.Some(100)
    let v2 = Option<Int64>.None
    let r1 = v1 ?? 0
    let r2 = v2 ?? 0
    print("${r1}")
    print("${r2}")

    let n = 10
    let r1 = 0..10 : 1
    let r2 = 0..=n : 1
    let r3 = n..0 : -2
    let r4 = 10..=0 : -2

    var a: Bool = true
    var b: Bool = !a
    var c: Bool = !false

    var a: Bool = true && true
    var b: Bool = true && false
    var c: Bool = false && false
    var d: Bool = false && true

    a = true || true
    b = true || false
    c = false || false
    d = false || true

    var a = !10
    a = !20
    a = 10 << 1
    a = 10 << 1 << 1
    a = 10 >> 1
    a = 10 & 15
    a = 10 ^ 15
    a = 10 | 15
    a = (1 ^ (8 & 15)) | 24

    var i: Int32 = 5
    i++ // i = 6
    i-- // i = 5
    var j = 0
    j = i--
}

// 1.5 注释
/*
 * comments 1
 */
func  comments() {
    var a = 1 // comments2
    var b =2 /* comments 3 */
}
