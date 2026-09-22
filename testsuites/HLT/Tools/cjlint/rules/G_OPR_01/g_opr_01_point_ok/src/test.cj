/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct Point {
    public var x = 0
    public var y = 0
    public operator func -(other: Point): Point {
        let p = Point()
        p.x = this.x - other.x
        p.y = this.y - other.y
        return p
    }
}

main() {
    let a = Point()
    let b = Point()
    let c = a - b
    println(c.x)
}
