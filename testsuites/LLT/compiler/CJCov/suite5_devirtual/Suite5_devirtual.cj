// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件5-1: 类型继承/虚方法去虚化 → 触发 CJDevirtualOpt.cpp (未覆盖79行)
//   isSubType 各 Kind 分支: TK_CLASS(继承链遍历), TK_TUPLE(嵌套子类型), TK_CFUNC(函数类型参数)
//   去虚化: 确定型时直接绑定虚方法调用
//   触发: class 继承 + interface + override + 通过基类调用虚方法
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface Shape {
    func area(): Float64
    func name(): String
}

class Circle <: Shape {
    let r: Float64
    public init(r: Float64) { this.r = r }
    public func area(): Float64 { return 3.14159 * r * r }
    public func name(): String { return "circle" }
}

class Square <: Shape {
    let s: Float64
    public init(s: Float64) { this.s = s }
    public func area(): Float64 { return s * s }
    public func name(): String { return "square" }
}

class Rectangle <: Shape {
    let w: Float64
    let h: Float64
    public init(w: Float64, h: Float64) { this.w = w; this.h = h }
    public func area(): Float64 { return w * h }
    public func name(): String { return "rectangle" }
}

// 通过基类 Shape 调用虚方法 → 去虚化判定
func totalArea(shapes: Array<Shape>): Float64 {
    var s = 0.0
    for (sh in shapes) {
        s += sh.area()    // 虚方法调用, 去虚化判定
    }
    return s
}

// 确切类型调用(可直接去虚化绑定)
func directCircle(c: Circle): Float64 {
    return c.area()
}

main(): Int64 {
    let shapes: Array<Shape> = [
        Circle(2.0), Square(3.0), Rectangle(2.0, 4.0), Circle(1.0)
    ]
    let a = totalArea(shapes)
    let b = directCircle(Circle(5.0))
    if (a > 0.0 && b > 0.0) { return 0 }
    return 1
}
