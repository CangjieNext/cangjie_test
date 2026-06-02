// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Darwin) DEPENDENCE: p1
// (CJNATIVE and not Darwin) EXEC:%compiler  %debugCHIROpt  p1/test0.cj %compile_lib_opt -o test0.%middle
// (CJNATIVE and not Darwin) EXEC:%compiler  %debugCHIROpt  test0.%middle test1.cj -o %output 2>&1 | compare %f
// (CJNATIVE and not Darwin) EXEC: %run %output

internal import std.reflect.*
internal import test0.*

main(): Unit {
    TypeInfo.of<C0<Int64>>() |> println
    TypeInfo.of<C0<Int64>>().instanceProperties.size |> println
    TypeInfo.of<C0<Int64>>().staticProperties.size |> println
    (TypeInfo.of<C0<Int64>>() as ClassTypeInfo).getOrThrow().instanceVariables.size |> println
    (TypeInfo.of<C0<Int64>>() as ClassTypeInfo).getOrThrow().staticVariables.size |> println
    TypeInfo.of<C0<Int64>>().instanceFunctions.size |> println
    TypeInfo.of<C0<Int64>>().staticFunctions.size |> println

    println()

    TypeInfo.of<C1>().instanceProperties.size |> println
    TypeInfo.of<C1>().staticProperties.size |> println
    (TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().instanceVariables.size |> println
    (TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().staticVariables.size |> println
    TypeInfo.of<C1>().instanceFunctions.size |> println
    TypeInfo.of<C1>().staticFunctions.size |> println

    println()

    TypeInfo.of<S0<Int64>>().instanceProperties.size |> println
    TypeInfo.of<S0<Int64>>().staticProperties.size |> println
    (TypeInfo.of<S0<Int64>>() as StructTypeInfo).getOrThrow().instanceVariables.size |> println
    (TypeInfo.of<S0<Int64>>() as StructTypeInfo).getOrThrow().staticVariables.size |> println
    TypeInfo.of<S0<Int64>>().instanceFunctions.size |> println
    TypeInfo.of<S0<Int64>>().staticFunctions.size |> println

    println()

    TypeInfo.of<S1>().instanceProperties.size |> println
    TypeInfo.of<S1>().staticProperties.size |> println
    (TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().instanceVariables.size |> println
    (TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().staticVariables.size |> println
    TypeInfo.of<S1>().instanceFunctions.size |> println
    TypeInfo.of<S1>().staticFunctions.size |> println
}


// (CJNATIVE) ASSERT: scan-not will be deleted
// (CJNATIVE) ASSERT: scan-not core dumped
// (CJNATIVE) ASSERT: scan-not stack trace