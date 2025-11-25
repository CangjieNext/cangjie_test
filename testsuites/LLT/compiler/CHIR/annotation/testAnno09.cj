// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Darwin)LEVEL: 0
// (not Darwin)EXEC: %compiler %cmp_opt %enableO2 %n.cj -o %output
// (not Darwin)EXEC: %run %output 2>&1 | compare %f

internal import std.reflect.*

@Annotation
public class A1 {
    public let v: Int64
    public const init(p0: Int64) {
        this.v = p0
    }
}

@Annotation
public class B1 {
    public let v: Int64
    public const init(p0: Int64) {
        this.v = p0
    }
}

public class C0 {
    @A1[12]
    @B1[12]
    public static var v: Int64 = 12
}

main() {
    (TypeInfo.of<C0>() as ClassTypeInfo).getOrThrow().getStaticVariable("v").findAnnotation<A1>().isSome() |> println
    (TypeInfo.of<C0>() as ClassTypeInfo).getOrThrow().getStaticVariable("v").annotations.size |> println
}

/* SCAN
true
2
*/
