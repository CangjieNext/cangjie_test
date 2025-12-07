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
        @Expect(TypeInfo.of<Int8>().staticFunctions.isEmpty())
        @Expect(TypeInfo.of<Int16>().staticFunctions.isEmpty())
        @Expect(TypeInfo.of<Int32>().staticFunctions.isEmpty())
        @Expect(TypeInfo.of<Int64>().staticFunctions.isEmpty())
        @Expect(TypeInfo.of<IntNative>().staticFunctions.isEmpty())
        @Expect(TypeInfo.of<UInt8>().staticFunctions.isEmpty())
        @Expect(TypeInfo.of<UInt16>().staticFunctions.isEmpty())
        @Expect(TypeInfo.of<UInt32>().staticFunctions.isEmpty())
        @Expect(TypeInfo.of<UInt64>().staticFunctions.isEmpty())
        @Expect(TypeInfo.of<UIntNative>().staticFunctions.isEmpty())
        @Expect(TypeInfo.of<Float16>().staticFunctions.isEmpty())
        @Expect(TypeInfo.of<Float32>().staticFunctions.isEmpty())
        @Expect(TypeInfo.of<Float64>().staticFunctions.isEmpty())
        @Expect(TypeInfo.of<Bool>().staticFunctions.isEmpty())
        @Expect(TypeInfo.of<Rune>().staticFunctions.isEmpty())
    }
    @TestCase
    func testInterface(): Unit {
        arr = TypeInfo.of<I0>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<I1>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[abstract static func i1_public_abstract_static_member_function_0(): Int16, abstract static func i1_public_abstract_static_member_function_1(Int64, Bool): Int16, abstract static func i1_public_abstract_static_member_function_2(): Int16, abstract static func i1_public_abstract_static_member_function_3(Rune, Float64): Int16, abstract static func i1_public_open_static_member_function_0(): Int64, abstract static func i1_public_open_static_member_function_1(): Int64]")
        arr = TypeInfo.of<I2>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[abstract static func i2_public_abstract_static_member_function_0(): Int16, abstract static func i2_public_abstract_static_member_function_1(Int64, Bool): Int16, abstract static func i2_public_abstract_static_member_function_2(): Int16, abstract static func i2_public_abstract_static_member_function_3(Rune, Float64): Int16, abstract static func i2_public_open_static_member_function_0(): Int64, abstract static func i2_public_open_static_member_function_1(): Int64]")
        arr = TypeInfo.of<I3>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[abstract static func i3_public_abstract_static_member_function_0(): Int16, abstract static func i3_public_abstract_static_member_function_1(Int64, Bool): Int16, abstract static func i3_public_abstract_static_member_function_2(): Int16, abstract static func i3_public_abstract_static_member_function_3(Rune, Float64): Int16]")
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        arr = TypeInfo.of<I4>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[abstract static func i4_public_abstract_static_member_function_0(): Int16, abstract static func i4_public_abstract_static_member_function_1(Int64, Bool): Int16, abstract static func i4_public_abstract_static_member_function_2(): Int16, abstract static func i4_public_abstract_static_member_function_3(Rune, Float64): Int16]")
        arr = TypeInfo.of<I5>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[abstract static func i5_public_abstract_static_member_function_0(): Int16, abstract static func i5_public_abstract_static_member_function_1(Int64, Bool): Int16, abstract static func i5_public_abstract_static_member_function_2(): Int16, abstract static func i5_public_abstract_static_member_function_3(Rune, Float64): Int16]")
        arr = TypeInfo.of<I6>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[abstract static func i6_public_abstract_static_member_function_0(): Int16, abstract static func i6_public_abstract_static_member_function_1(Int64, Bool): Int16, abstract static func i6_public_abstract_static_member_function_2(): Int16, abstract static func i6_public_abstract_static_member_function_3(Rune, Float64): Int16]")
    }
    @TestCase
    func testClass(): Unit {
        arr = TypeInfo.of<C0>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<C1>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static func c1_public_static_member_function_0(UInt16, Rune): UInt32, static func c1_public_static_member_function_0(UInt16, Rune, Float16): UInt32, static func c1_public_static_member_function_0(UInt16, Rune, Float16, MyType.myType.C1): UInt32, static func c1_public_static_member_function_1(String): Float64, static func c1_public_static_member_function_1(String, UInt32): Float64, static func c1_public_static_member_function_1(String, UInt32, MyType.myType.C1): Float64, static func c1_public_static_member_function_2(String): Float64]")
        arr = TypeInfo.of<C2>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static func c2_public_static_member_function_0(UInt16, Rune): UInt32, static func c2_public_static_member_function_0(UInt16, Rune, Float16): UInt32, static func c2_public_static_member_function_0(UInt16, Rune, Float16, MyType.myType.S1): UInt32, static func c2_public_static_member_function_1(String): Float64, static func c2_public_static_member_function_1(String, UInt32): Float64, static func c2_public_static_member_function_1(String, UInt32, MyType.myType.C1): Float64]")
        arr = TypeInfo.of<C3>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static func c3_public_static_member_function_0(UInt16, Rune): UInt32, static func c3_public_static_member_function_0(UInt16, Rune, Float16): UInt32, static func c3_public_static_member_function_0(UInt16, Rune, Float16, MyType.myType.S1): UInt32, static func c3_public_static_member_function_1(String): Float64, static func c3_public_static_member_function_1(String, UInt32): Float64, static func c3_public_static_member_function_1(String, UInt32, MyType.myType.C1): Float64]")
        arr = TypeInfo.of<C4>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[redef static func c2_public_static_member_function_0(UInt16, Rune): UInt32, redef static func c2_public_static_member_function_0(UInt16, Rune, Float16): UInt32, static func c4_public_static_member_function_0(UInt16, Rune): UInt32, static func c4_public_static_member_function_0(UInt16, Rune, Float16): UInt32, static func c4_public_static_member_function_0(UInt16, Rune, Float16, MyType.myType.S1): UInt32, static func c4_public_static_member_function_1(String): Float64, static func c4_public_static_member_function_1(String, UInt32): Float64, static func c4_public_static_member_function_1(String, UInt32, MyType.myType.C1): Float64]")
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        arr = TypeInfo.of<C5>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static func c5_public_static_member_function_0(UInt16, Rune): UInt32, static func c5_public_static_member_function_0(UInt16, Rune, Float16): UInt32, static func c5_public_static_member_function_0(UInt16, Rune, Float16, MyType.myType.S1): UInt32, static func c5_public_static_member_function_1(String): Float64, static func c5_public_static_member_function_1(String, UInt32): Float64, static func c5_public_static_member_function_1(String, UInt32, MyType.myType.C1): Float64, static func i1_public_abstract_static_member_function_0(): Int16, static func i1_public_abstract_static_member_function_1(Int64, Bool): Int16, static func i1_public_abstract_static_member_function_2(): Int16, static func i1_public_abstract_static_member_function_3(Rune, Float64): Int16]")
        arr = TypeInfo.of<C6>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static func c6_public_static_member_function_0(UInt16, Rune): UInt32, static func c6_public_static_member_function_0(UInt16, Rune, Float16): UInt32, static func c6_public_static_member_function_0(UInt16, Rune, Float16, MyType.myType.S1): UInt32, static func c6_public_static_member_function_1(String): Float64, static func c6_public_static_member_function_1(String, UInt32): Float64, static func c6_public_static_member_function_1(String, UInt32, MyType.myType.C1): Float64]")
        arr = TypeInfo.of<C7<Unit, Rune, Float16, UInt16>>().staticFunctions |>
            map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static func c7_public_static_member_function_0(UInt16, Rune): UInt32, static func c7_public_static_member_function_0(UInt16, Rune, Float16): UInt32, static func c7_public_static_member_function_0(UInt16, Rune, Float16, MyType.myType.S1): UInt32, static func c7_public_static_member_function_1(String): Float64, static func c7_public_static_member_function_1(String, UInt32): Float64, static func c7_public_static_member_function_1(String, UInt32, MyType.myType.C1): Float64]")
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        arr = TypeInfo.of<C8>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static func c8_public_static_member_function_0(UInt16, Rune): UInt32, static func c8_public_static_member_function_0(UInt16, Rune, Float16): UInt32, static func c8_public_static_member_function_0(UInt16, Rune, Float16, MyType.myType.S1): UInt32, static func c8_public_static_member_function_1(String): Float64, static func c8_public_static_member_function_1(String, UInt32): Float64, static func c8_public_static_member_function_1(String, UInt32, MyType.myType.C1): Float64, static func i1_public_abstract_static_member_function_0(): Int16, static func i1_public_abstract_static_member_function_1(Int64, Bool): Int16, static func i1_public_abstract_static_member_function_2(): Int16, static func i1_public_abstract_static_member_function_3(Rune, Float64): Int16, static func i2_public_abstract_static_member_function_0(): Int16, static func i2_public_abstract_static_member_function_1(Int64, Bool): Int16, static func i2_public_abstract_static_member_function_2(): Int16, static func i2_public_abstract_static_member_function_3(Rune, Float64): Int16, static func i3_public_abstract_static_member_function_0(): Int16, static func i3_public_abstract_static_member_function_1(Int64, Bool): Int16, static func i3_public_abstract_static_member_function_2(): Int16, static func i3_public_abstract_static_member_function_3(Rune, Float64): Int16]")
        arr = TypeInfo.of<C9>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static func c9_public_static_member_function_0(UInt16, Rune): UInt32, static func c9_public_static_member_function_0(UInt16, Rune, Float16): UInt32, static func c9_public_static_member_function_0(UInt16, Rune, Float16, MyType.myType.S1): UInt32, static func c9_public_static_member_function_1(String): Float64, static func c9_public_static_member_function_1(String, UInt32): Float64, static func c9_public_static_member_function_1(String, UInt32, MyType.myType.C1): Float64]")
    }
    @TestCase
    func testStruct(): Unit {
        arr = TypeInfo.of<S0>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<S1>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static func s1_public_static_member_function_0(UInt16, Rune): UInt32, static func s1_public_static_member_function_0(UInt16, Rune, Float16): UInt32, static func s1_public_static_member_function_0(UInt16, Rune, Float16, MyType.myType.C1): UInt32, static func s1_public_static_member_function_1(String): Float64, static func s1_public_static_member_function_1(String, UInt32): Float64, static func s1_public_static_member_function_1(String, UInt32, MyType.myType.C1): Float64]")
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        arr = TypeInfo.of<S2>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static func i1_public_abstract_static_member_function_0(): Int16, static func i1_public_abstract_static_member_function_1(Int64, Bool): Int16, static func i1_public_abstract_static_member_function_2(): Int16, static func i1_public_abstract_static_member_function_3(Rune, Float64): Int16, static func s2_public_static_member_function_0(UInt16, Rune): UInt32, static func s2_public_static_member_function_0(UInt16, Rune, Float16): UInt32, static func s2_public_static_member_function_0(UInt16, Rune, Float16, MyType.myType.S1): UInt32, static func s2_public_static_member_function_1(String): Float64, static func s2_public_static_member_function_1(String, UInt32): Float64, static func s2_public_static_member_function_1(String, UInt32, MyType.myType.C1): Float64]")
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        arr = TypeInfo.of<S3>().staticFunctions |> map {a: StaticFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static func i1_public_abstract_static_member_function_0(): Int16, static func i1_public_abstract_static_member_function_1(Int64, Bool): Int16, static func i1_public_abstract_static_member_function_2(): Int16, static func i1_public_abstract_static_member_function_3(Rune, Float64): Int16, static func i2_public_abstract_static_member_function_0(): Int16, static func i2_public_abstract_static_member_function_1(Int64, Bool): Int16, static func i2_public_abstract_static_member_function_2(): Int16, static func i2_public_abstract_static_member_function_3(Rune, Float64): Int16, static func i3_public_abstract_static_member_function_0(): Int16, static func i3_public_abstract_static_member_function_1(Int64, Bool): Int16, static func i3_public_abstract_static_member_function_2(): Int16, static func i3_public_abstract_static_member_function_3(Rune, Float64): Int16, static func s3_public_static_member_function_0(UInt16, Rune): UInt32, static func s3_public_static_member_function_0(UInt16, Rune, Float16): UInt32, static func s3_public_static_member_function_0(UInt16, Rune, Float16, MyType.myType.S1): UInt32, static func s3_public_static_member_function_1(String): Float64, static func s3_public_static_member_function_1(String, UInt32): Float64, static func s3_public_static_member_function_1(String, UInt32, MyType.myType.C1): Float64]")
    }
}
