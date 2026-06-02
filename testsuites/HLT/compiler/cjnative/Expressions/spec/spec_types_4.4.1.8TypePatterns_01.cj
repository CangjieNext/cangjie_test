/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

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

main(): Int64 {
    let normalPt = Point(5, 10)
    let colorPt = ColoredPoint(8, 24, "red")
    var rectangleArea1: Int32 = match (normalPt) {
        case _: Point => normalPt.x * normalPt.y
        case _ => 0
    }
    var rectangleArea2: Int32 = match (colorPt) {
        case cpt: Point => cpt.x * cpt.y
        case _ => 0
    }
    return 0
}
