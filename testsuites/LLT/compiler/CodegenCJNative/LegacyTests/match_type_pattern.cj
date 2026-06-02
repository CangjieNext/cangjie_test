// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class X {
    public var val: Int32 = 0
}

class X1 <: X {}

class X2 <: X {}

open class A {
    public var a: Int32 = 0
}

open class AA <: A {}

interface I {}

class AAA <: AA & I {
    public init(x: Int32) {
        a = x
    }
}

open class Point {
    public var x: Int32
    public var y: Int32
    public init(x: Int32, y: Int32) {
        this.x = x
        this.y = y
    }
}

class ColoredPoint <: Point {
    public var color: String
    public init(x: Int32, y: Int32, color: String) {
        super(x, y)
        this.color = color
    }
}

func codegenUnitTest(): Int32 {
    var x: A = AAA(1)
    var a: Int32 = match (x) {
        case q: X1 => q.val
        case w: X2 => w.val
        case v: Int32 => v
        case r: AA => r.a
        case e: A => e.a + 1
        case t: I => 3
        case _ => 0
    }
    let normalPo = Point(5, 10)
    let colorPo = ColoredPoint(8, 24, "red")

    var rectangleArea1: Int32 = match (normalPo) {
        case _: Point => normalPo.x * normalPo.y //type pattern
        case _ => 0
    }
    var rectangleArea2: Int32 = match (colorPo) {
        case cp: Point => cp.x * cp.y // subtype
        case _ => 0
    }
    return rectangleArea1 + rectangleArea2 + a
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 243) {
        return 0
    } else {
        return -1
    }
}
