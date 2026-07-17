// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件1 补充: enum 反射分支 → CJFillMetadata getEnumReflectInfo / fillEnumReflectInfo
// --dy-std 必需，否则 pkg_info 不生成，ReflectInfo::enable(M) 返回 false
// EXEC: %compiler %cmp_opt %import-cangjie-stdx --dy-std --coverage %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

import std.reflect.*

// 带构造器的 enum → 触发 EnumCtor 反射 (parseEnumCtorMDs)
enum Color {
    | Red(UInt8)
    | Green(UInt8)
    | Blue(UInt8)
}

// 带方法和构造器的 enum → parseInstanceMethodMDs + parseStaticMethodMDs
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
    // TypeInfo 查询 → 触发编译期反射元数据填充
    let ct = TypeInfo.of<Color>()
    let st = TypeInfo.of<Shape>()
    let s = Shape.Circle(2.0)
    let a = s.area()
    if (a > 0.0) { return 0 }
    return 1
}
