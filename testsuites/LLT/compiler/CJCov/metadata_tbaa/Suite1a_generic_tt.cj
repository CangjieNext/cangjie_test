// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件1a-4: 泛型类型信息 → CJFillMetadata fillTemplate/isStructType/isTuple/isClass
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class GenericClass<T> {
    let v: T
    public init(v: T) { this.v = v }
}
interface GenericIface<T> { func f(t: T): Int64 }
struct GenericStruct<T> {
    let v: T
    public init(v: T) { this.v = v }
}
public func identity<T>(x: T): T { x }
class Impl <: GenericIface<Int64> {
    public func f(t: Int64): Int64 { t + 1 }
}

main(): Int64 {
    let a = GenericClass<Int64>(1)
    let b = GenericClass<String>("x")
    let s = GenericStruct<Float64>(2.0)
    let impl = Impl()
    let r = identity<Int64>(42)
    let r2 = identity<String>("hi")
    if (a.v == 1 && impl.f(1) == 2 && s.v > 0.0 && r == 42 && b.v == "x" && r2 == "hi") { return 0 }
    return 1
}
