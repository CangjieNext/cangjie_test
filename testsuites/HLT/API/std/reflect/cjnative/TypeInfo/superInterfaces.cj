/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (not MAC) EXEC: cd ./MyType && %compiler %cmp_opt --output-type=dylib --module-name=MyType ./src/myType/*.cj -o libMyType_myType.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f --import-path . -L ./MyType -lMyType_myType %cmp_utest_opt
// (not MAC) RUN-EXEC: %cp ./MyType/libMyType_myType.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args
import std.reflect.*
import MyType.myType.*
import std.collection.*
import std.sort.SortExtension

@Test
class Test {
    var arr = Array<String>()

    @TestCase
    func testPrimitive(): Unit {
        arr = TypeInfo.of<Int8>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<Int16>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<Int32>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<Int64>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<IntNative>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<UInt8>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<UInt16>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<UInt32>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<UInt64>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<UIntNative>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<Float16>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<Float32>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<Float64>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<Bool>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<Rune>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
    }
    @TestCase
    func testInterface(): Unit {
        arr = TypeInfo.of<I0>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<I1>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<I2>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<I3>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<I4>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any, MyType.myType.I1]")
        arr = TypeInfo.of<I5>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any, MyType.myType.I1, MyType.myType.I2, MyType.myType.I3]")
    }
    @TestCase
    func testClass(): Unit {
        arr = TypeInfo.of<C0>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<C1>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<C2>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<C3>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<C4>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<C5>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any, MyType.myType.I1]")
        arr = TypeInfo.of<C6>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        // 带泛型的class目前会segfault。
        arr = TypeInfo.of<C8>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any, MyType.myType.I1, MyType.myType.I2, MyType.myType.I3]")
    }
    @TestCase
    func testStruct(): Unit {
        arr = TypeInfo.of<S0>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<S1>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any]")
        arr = TypeInfo.of<S2>().superInterfaces |> map {a: InterfaceTypeInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[Any, MyType.myType.I1]")
    }
}
