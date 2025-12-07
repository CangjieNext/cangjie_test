/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f
// (not MAC) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
/* SCAN
default.S0<Int64, Bool, Rune>
Array<Int64>
Array<Box<Int64>>
Rune
Int64
UInt64
default.S0<Int64, String, Array<Array<Int64>>>
String
Array<Array<Array<Int64>>>
Array<Int64>*/

import std.reflect.*

public enum E0 {
    ConstructorA | ConstructorB | ConstructorC
}

public struct S0<T, U, G> {}

type MyT = S0<Int, String, Array<Array<Int>>>

main(): Unit {
    TypeInfo.of<S0<Int64, Bool, Rune>>() |> println
    TypeInfo.of<Array<Int64>>() |> println
    TypeInfo.of<Array<Box<Int64>>>() |> println
    TypeInfo.of<Rune>() |> println
    TypeInfo.of<Int>() |> println
    TypeInfo.of<UInt>() |> println
    TypeInfo.of<MyT>() |> println

    TypeInfo.of<String>() |> println
    TypeInfo.of<Array<Array<Array<Int64>>>>() |> println
    TypeInfo.of<Array<Int64>>() |> println
}
