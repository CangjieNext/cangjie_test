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
main() {
    let normalPt = Point(5, 10)
    var rectangleArea1: Int64 = match (normalPt) {
        case _: Point => normalPt.x * normalPt.y
        case _ => 0
    }
    0
}
