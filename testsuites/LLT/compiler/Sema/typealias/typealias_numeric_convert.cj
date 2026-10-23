// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// EXEC: %run %run_opt %n.%suffix

// Issue #1045: type alias should be usable for numeric type conversion

// === Type aliases for all numeric/rune types ===
type word = UInt16
type myInt8 = Int8
type myUInt32 = UInt32
type myInt64 = Int64
type myFloat32 = Float32
type myFloat64 = Float64
type myRune = Rune
type myUInt8 = UInt8

// Chained type alias
type myWord = word

// Nested type alias (alias of alias)
type nestedInt64 = myInt64

main(): Int64 {
    // === Basic numeric type alias conversion ===
    var a: UInt16 = word(20)
    if (a != 20) { return 1 }

    var b: Int8 = myInt8(-8)
    if (b != -8) { return 2 }

    var c: UInt32 = myUInt32(100000)
    if (c != 100000) { return 3 }

    var d: Int64 = myInt64(-999999)
    if (d != -999999) { return 4 }

    var e: Float32 = myFloat32(3.14)
    if (e < 3.13 || e > 3.15) { return 5 }

    var f: Float64 = myFloat64(2.71828)
    if (f < 2.71 || f > 2.72) { return 6 }

    var g: Rune = myRune(65)
    if (g != r'A') { return 7 }

    // === Edge cases: zero, min, max, negative ===
    var h: UInt16 = word(0)
    if (h != 0) { return 8 }

    var i: UInt8 = myUInt8(255)
    if (i != 255) { return 9 }

    var j: Int64 = myInt64(-9223372036854775807)
    if (j != -9223372036854775807) { return 10 }

    // === Chained type alias: myWord -> word -> UInt16 ===
    var k: UInt16 = myWord(42)
    if (k != 42) { return 11 }

    // === Nested type alias: nestedInt64 -> myInt64 -> Int64 ===
    var t = nestedInt64(1)
    if (t != 1) { return 23 }
    var u = nestedInt64(-5)
    if (u != -5) { return 24 }

    // === Usage in expressions ===
    var l = word(10) + word(20)
    if (l != 30) { return 12 }

    var m = myInt64(100) * myInt64(2)
    if (m != 200) { return 13 }

    var n = myFloat32(5.5) / myFloat32(2.0)
    if (n < 2.5 || n > 3.0) { return 14 }

    // === Type alias conversion with different source expression types ===
    var o: UInt16 = word(1 + 2)
    if (o != 3) { return 15 }

    var p: Int64 = myInt64(if (true) { 10 } else { 20 })
    if (p != 10) { return 16 }

    // === Float literal -> integer type alias conversion (truncation toward zero) ===
    var q: UInt16 = word(20.05)
    if (q != 20) { return 17 }

    var r: Int64 = myInt64(20.05)
    if (r != 20) { return 18 }

    var s: Int8 = myInt8(-3.9)
    if (s != -3) { return 19 }

    return 0
}
