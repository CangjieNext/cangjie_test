/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func test_int(a: Int8) {
    var t1 = a
    return 0
}

func test_Uint(a: UInt8, b: UInt16, c: UInt32, d: UInt64, e: UIntNative) {
    var t1 = a
    var t2 = b
    var t3 = c
    var t4 = d
    var t5 = e
    return 0
}

func test_Float(a: Float16, b: Float16, c: Float16, d: Float32, e: Float32, f: Float32, g: Float64, h: Float64,
    i: Float64, j: Float64) {
    var t1 = a
    var t2 = b
    var t3 = c
    var t4 = d
    var t5 = e
    var t6 = f
    var t7 = g
    var t8 = h
    var t9 = i
    var t10 = j
    return 0
}

func test_bool(a: Bool) {
    var t1 = a
    return 0
}

func test_rune(a: Rune, b: Rune, c: Rune, d: Rune, e: Rune) {
    var t1 = a
    var t2 = b
    var t3 = c
    var t4 = d
    var t5 = e
    return 0
}

func test_tuple(a: (Int64, Int64), b: (Int64, Int64), c: (Int64, Int64), d: (Int64, Int64), e: (Int64, Int64),
    f: (Int64, Int64), g: (Int64, Int64), h: (Int64, Int64), i: (Int64, Int64), j: (Int64, Int64)) {
    var t1 = a
    var t2 = b
    var t3 = c
    var t4 = d
    var t5 = e
    var t6 = f
    var t7 = g
    var t8 = h
    var t9 = i
    var t10 = j
    return 0
}

func test_range(a: Range<Int64>) {
    var t1 = a
    return 0
}

func test_String(a: String, b: String, c: String, d: String, e: String) {
    var t1 = a
    var t2 = b
    var t3 = c
    var t4 = d
    var t5 = e
    return 0
}

open class Rect {
    var a: Int64 = 10
    var b: Int64 = 10
    public open func area(): Int64 {
        return a * b
    }
    public func area1(): Int64 {
        return a * b + 1
    }
}

class C1 <: Rect {
    public override func area(): Int64 {
        return 10
    }
}

struct S1 {
    public func area2(): Int64 {
        return 10
    }
}

enum RGBColor {
    | Red | Green | Blue(Int64)

    func fRune() {
        0
    }
}

func test_locals() {
    var b = 10
    func test_locals1() {
        var a = 10
        return 0
    }
    test_locals1()
}

main() {
    var c1 = C1()
    var r1 = Rect()
    var r2 = r1.area1()
    var s1 = S1()
    var s2 = s1.area2()
    var b = c1.area()
    var a1 = RGBColor.Red
    a1.fRune()
    let r3 = {
        a: Int64, b: Int64 =>
         a + b
    }(1, 2)
    test_locals()
    return 0
}
