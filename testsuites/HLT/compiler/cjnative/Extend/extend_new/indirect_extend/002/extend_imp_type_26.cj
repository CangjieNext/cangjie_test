/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type ar<T> = Array<T>

type A<T> = I<T>

extend<T> ar<T> <: A<T> {
    public operator func +(inputB: ar<T>): Int32 {
        return 1
    }
}

interface I<T> {
    operator func +(inputB: ar<T>): Int32 {
        return 1
    }
}

open class Point {
    public var x: Int32 = 1
    public var y: Int32 = 2
    public init(x: Int32, y: Int32) {
        this.x = x
        this.y = y
    }
}

class ColoredPoint <: Point {
    public var color: String = "green"

    public init(x: Int32, y: Int32, color: String) {
        super(x, y)
        this.color = color
    }
}

let normalPt = Point(5, 10)
let colorPt = ColoredPoint(8, 24, "red")
var a: ar<Int32> = []
var rectangleArea1: ar<Int32> = match (normalPt) {
    case _: Point => [normalPt.x, normalPt.y, a + a]
    case _ => ar<Int32>(1, repeat: 2)
}
var rectangleArea2: ar<Int32> = match (colorPt) {
    case cpt: Point => [cpt.x, cpt.y]
    case _ => ar<Int32>(1, repeat: 2)
}

main(): Int64 {
    if (rectangleArea1[0] + rectangleArea1[1] == 15 && rectangleArea2[0] + rectangleArea2[1] == 32 &&
        rectangleArea1[2] == 1) {
        return 0
    } else {
        return 1
    }
}
