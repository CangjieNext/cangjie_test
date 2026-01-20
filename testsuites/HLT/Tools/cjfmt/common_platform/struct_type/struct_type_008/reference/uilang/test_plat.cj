/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific internal struct Point {
    var x: Int64 = 0
    var y: Int64 = 0
    specific public init(a: Int64, b: Int64) {
        x = a
        y = b
    }

    specific public operator func -(): Point {
        Point(-x, -y)
    }

    specific public operator func +(right: Point): Point {
        Point(this.x + right.x, this.y + right.y)
    }

    specific operator func [](arg1: Int64, arg2: String): Int64 {
        return 0
    }
}
