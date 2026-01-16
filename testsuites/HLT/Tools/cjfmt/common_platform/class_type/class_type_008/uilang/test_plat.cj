/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public open specific class Point {
    var x: Int64 = 0
    var y: Int64 = 0
    public specific init (a: Int64, b: Int64) {
        x = a
        y = b
    }

    public specific operator func -(): Point {
        Point(-x, -y)
    }

    public operator specific func +(right: Point): Point {
        Point(this.x + right.x, this.y + right.y)
    }
}
