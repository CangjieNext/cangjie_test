/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.ClassInitPara

public open class Point {
    //aaaaaaaaa
    var x: Int32 = 1
    var y: Int32 = 2

    init(x: Int32, y: Int32) {
        this.x = x
        this.y = y
    }
    init() {}
}

public class ColoredPoint <: Point {
    var color: String = "green"
    init(x: Int32, y: Int32, color: String) {
        super(x, y)
        this.color = color
    }
    init(a: Int32) {}
}

let s1 = Point(5, 10)
let s2 = ColoredPoint(8, 24, "red")
let s3 = ColoredPoint(1)
