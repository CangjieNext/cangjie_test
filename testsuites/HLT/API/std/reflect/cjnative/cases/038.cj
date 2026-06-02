/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
import std.reflect.*

@Annotation
public class A0 {
    public const init() {}
}

public class Foo {
    public func f(@A0 p0: Int64, @A0 p1: Rune): Unit  {}
    public func f0(@A0 p0: Int64): Unit  {}
}

main(): Unit {
    TypeInfo.of<Foo>().getInstanceFunction("f", TypeInfo.of<Int64>(), TypeInfo.of<Rune>()).parameters.size |> println
    TypeInfo
        .of<Foo>()
        .getInstanceFunction("f", TypeInfo.of<Int64>(), TypeInfo.of<Rune>())
        .parameters[0]
        .annotations
        .size |> println
    TypeInfo
        .of<Foo>()
        .getInstanceFunction("f", TypeInfo.of<Int64>(), TypeInfo.of<Rune>())
        .parameters[1]
        .annotations
        .size |> println

    println("===")

    TypeInfo.of<Foo>().getInstanceFunction("f0", TypeInfo.of<Int64>()).parameters.size |> println
    TypeInfo.of<Foo>().getInstanceFunction("f0", TypeInfo.of<Int64>()).parameters[0].annotations.size |> println
}
