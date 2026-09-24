/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.deriving.*

@Derive[ToString]
struct Point {
    Point(let x: Int64, let y: Int64) {}
}

@Derive[ToString, Equatable]
enum Color {
    | Red | Green | Blue
}

@Derive[ToString]
@DeriveOrder[y, x]
struct Ordered {
    Ordered(let x: Int64, let y: Int64) {}
}

main() {
    let p1 = Point(1, 2)
    println("${p1}")
    println(Color.Red)
    println(Ordered(1, 2))
}
