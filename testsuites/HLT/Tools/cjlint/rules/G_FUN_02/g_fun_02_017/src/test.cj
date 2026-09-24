/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum Color {
    Red | Green
}

class Point {
    var x = 0.0
}

func inspect(label: Bool, ratio: Float64, color: Color, pt: Option<Point>, pair: (Int64, Int64)): Unit {
    println(label)
}

main() {
    inspect(true, 1.5, Color.Green, Some(Point()), (1, 2))
}
