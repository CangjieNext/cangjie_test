/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (host_win) EXEC: if not exist %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix %compiler %cmp_opt %compile_library --module-name=MyType ./MyType/src/myType/*.cj -o %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix
// (!host_win) EXEC: [ ! -f %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix ] && %compiler %cmp_opt %compile_library --module-name=MyType ./MyType/src/myType/*.cj -o %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix || true
// EXEC: %compiler %cmp_opt -o %output %f -L %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType --import-path %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType -lMyType.myType %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
import std.reflect.*
import MyType.myType.*
import std.sort.SortExtension
import std.collection.*

@Test
class Test {
    var arr = Array<String>()
    @TestCase
    func testClass(): Unit {
        arr = (TypeInfo.of<I0>() as InterfaceTypeInfo).getOrThrow().sealedSubtypes |> map {a: TypeInfo => a.toString()} |>
            collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = (TypeInfo.of<I1>() as InterfaceTypeInfo).getOrThrow().sealedSubtypes |> map {a: TypeInfo => a.toString()} |>
            collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = (TypeInfo.of<I2>() as InterfaceTypeInfo).getOrThrow().sealedSubtypes |> map {a: TypeInfo => a.toString()} |>
            collectArray
        arr.sort();
        @Expect(arr.toString(), "[MyType.myType.C8, MyType.myType.I2, MyType.myType.I5, MyType.myType.S3]")
        arr = (TypeInfo.of<I3>() as InterfaceTypeInfo).getOrThrow().sealedSubtypes |> map {a: TypeInfo => a.toString()} |>
            collectArray
        arr.sort();
        @Expect(arr.toString(), "[MyType.myType.C8, MyType.myType.I3, MyType.myType.I5, MyType.myType.S3]")
        arr = (TypeInfo.of<I4>() as InterfaceTypeInfo).getOrThrow().sealedSubtypes |> map {a: TypeInfo => a.toString()} |>
            collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = (TypeInfo.of<I5>() as InterfaceTypeInfo).getOrThrow().sealedSubtypes |> map {a: TypeInfo => a.toString()} |>
            collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = (TypeInfo.of<I6>() as InterfaceTypeInfo).getOrThrow().sealedSubtypes |> map {a: TypeInfo => a.toString()} |>
            collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
    }
}
