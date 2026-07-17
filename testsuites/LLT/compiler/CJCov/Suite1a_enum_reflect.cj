// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件1a-2: enum 反射 → CJFillMetadata getEnumReflectInfo/fillEnumReflectInfo
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum Color { Red | Green | Blue }
enum Shape {
    | Circle(Float64)
    | Square(Float64)
    | Rectangle(Float64, Float64)
    public func area(): Float64 {
        match (this) {
            case Circle(r) => 3.14159 * r * r
            case Square(s) => s * s
            case Rectangle(w, h) => w * h
        }
    }
    public static func defaultShape(): Shape { Shape.Circle(1.0) }
}

main(): Int64 {
    let s = Shape.Circle(2.0)
    let s2 = Shape.defaultShape()
    let a = s.area()
    if (a > 0.0 && s2.area() >= 0.0) { return 0 }
    return 1
}
