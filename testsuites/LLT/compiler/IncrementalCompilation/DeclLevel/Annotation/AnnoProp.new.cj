internal import std.reflect.*
internal import std.collection.*
internal import std.sort.*

@Annotation
public class A0 {
    public const init() {}
}

public interface I0 {
    // member properties.
    @A0
    static prop i0_p0: Int64 { get(){12} }
    @A0
    prop i0_p1: Int64 { get(){12} }
    static prop i0_p2: Int64
    prop i0_p3: Int64

    // member functions.
    @A0
    static func i0_f0(): Float64 { 1.2 }
    @A0
    func i0_f1(): Float64 { 1.2 }
    static func i0_f2(): Float64
    func i0_f3(): Float64
}

public abstract class C1 {
    // member properties.
    public static prop c1_p0: Int64 { get(){12} }
    public prop c1_p1: Int64 { get(){12} }
    // public static prop c1_p2: Int64
    public prop c1_p3: Int64

    // member functions.
    public static func c1_f0(): Float64 { 1.2 }
    // public static func c1_f1(): Float64
    public func c1_f2(): Float64 { 1.2 }
    public func c1_f3(): Float64
}

public interface I1 <: I0 {
    // override inherited member functions.
    static func i0_f0(): Float64 { 1.2 }
    func i0_f1(): Float64 { 1.2 }

    // override inherited member properties.
    static prop iX_p0: Int64 { get(){13} }
    prop i0_p1: Int64 { get(){13} }
}
public abstract class C0 <: C1 & I0 {
    // override inherited member functions.
    public static func i0_f0(): Float64 { 1.2 }
    public func i0_f1(): Float64 { 1.2 }

    // override inherited member properties.
    public static prop i0_p0: Int64 { get(){12} }
    public prop i0_p1: Int64 { get(){12} }

    public static func i0_f2(): Float64 { 1.2 }
    public static prop i0_p2: Int64 { get(){12} }
}

main(): Unit {
    var arr = Array<String>()

    arr = TypeInfo.of<I1>().staticFunctions |> map { a: StaticFunctionInfo => a.toString() } |> collectArray; arr.sort(); arr |> println
    arr = TypeInfo.of<I1>().instanceFunctions |> map { a: InstanceFunctionInfo => a.toString() } |> collectArray; arr.sort(); arr |> println

    arr = TypeInfo.of<C0>().staticFunctions |> map { a: StaticFunctionInfo => a.toString() } |> collectArray; arr.sort(); arr |> println
    arr = TypeInfo.of<C0>().instanceFunctions |> map { a: InstanceFunctionInfo => a.toString() } |> collectArray; arr.sort(); arr |> println

    TypeInfo.of<C0>().getStaticFunction("i0_f0").annotations.size |> println
    TypeInfo.of<C0>().getInstanceFunction("i0_f1").annotations.size |> println

    TypeInfo.of<I1>().getStaticFunction("i0_f0").annotations.size |> println
    // TypeInfo.of<I0>().findInstanceFunction("i0_f1").getOrThrow().annotations.size |> println

    I1.i0_p0 |> println
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
