/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class Point {
    var x: Int64 = 0
    var y: Int64 = 0
    public init (a: Int64, b: Int64) {
        x = a
        y = b
    }

    public operator func -(): Point {
        Point(-x, -y)
    }
    public operator func +(right: Point): Point {
        Point(this.x + right.x, this.y + right.y)
    }
}

enum E {
    Y | X | X(Int64)

    public operator func ()(p: Int64) {}
    public operator func ()(p: Float64) {}
}

class A<T> {
    operator func [](arg1: Int64, arg2: String): Int64 {
        return 8
    }
}

main():Int64 {
    let p1 = Point(8, 24)
    let p2 = -p1
    let p3 = p1 + p2

    let e = E.X(1)
    E.X(1)
    let e1 = E.X
    e1(1)
    E.Y(1)
    let a = A<Int64>()
    let b: Int64 = a[1, "2"]
    return 0
}
