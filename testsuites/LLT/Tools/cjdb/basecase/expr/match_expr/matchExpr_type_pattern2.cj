// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

open class Point {
    var x: Int64 = 1
    var y: Int64 = 2
    init(x: Int64, y: Int64) {
        this.x = x
        this.y = y
    }
}
class ColoredPoint <: Point {
    var color: String = "green"
    init(x: Int64, y: Int64, color: String) {
        super(x, y)
        this.color = color
    }
}
main() {
    let colorPt = ColoredPoint(8, 24, "red")
    var rectangleArea1: Int64 = match (colorPt) {
        case cpt: Point => cpt.x * cpt.y
        case _ => 0
    }
    0
}
