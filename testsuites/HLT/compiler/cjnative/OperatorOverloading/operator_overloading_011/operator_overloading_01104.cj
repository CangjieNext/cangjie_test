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

// spec 示例转化
class Point {
    public var x: Int32 = 0
    public var y: Int32 = 0
    public init(a: Int32, b: Int32) {
        x = a
        y = b
    }
    public operator func -(): Point {
        Point(-this.x, -this.y)
    }
    public operator func +(right: Point): Point {
        Point(this.x + right.x, this.y + right.y)
    }
}

main(): Int64 {
    let p1 = Point(8, 24)
    let p2 = -p1
    let p3 = p1 + p2
    if (p2.x == -8 && p3.y == 0) {
        return 0
    }
    return 1
}
