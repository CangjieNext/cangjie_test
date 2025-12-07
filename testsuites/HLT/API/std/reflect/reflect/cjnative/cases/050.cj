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
        @Expect(TypeInfo.of<Int8>().instanceFunctions.isEmpty())
        @Expect(TypeInfo.of<Int16>().instanceFunctions.isEmpty())
        @Expect(TypeInfo.of<Int32>().instanceFunctions.isEmpty())
        @Expect(TypeInfo.of<Int64>().instanceFunctions.isEmpty())
        @Expect(TypeInfo.of<IntNative>().instanceFunctions.isEmpty())
        @Expect(TypeInfo.of<UInt8>().instanceFunctions.isEmpty())
        @Expect(TypeInfo.of<UInt16>().instanceFunctions.isEmpty())
        @Expect(TypeInfo.of<UInt32>().instanceFunctions.isEmpty())
        @Expect(TypeInfo.of<UInt64>().instanceFunctions.isEmpty())
        @Expect(TypeInfo.of<UIntNative>().instanceFunctions.isEmpty())
        @Expect(TypeInfo.of<Float16>().instanceFunctions.isEmpty())
        @Expect(TypeInfo.of<Float32>().instanceFunctions.isEmpty())
        @Expect(TypeInfo.of<Float64>().instanceFunctions.isEmpty())
        @Expect(TypeInfo.of<Bool>().instanceFunctions.isEmpty())
        @Expect(TypeInfo.of<Rune>().instanceFunctions.isEmpty())
    }
    @TestCase
    func testInterface(): Unit {
        arr = TypeInfo.of<I0>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<I1>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open abstract func i1_public_abstract_instance_member_function_0(): Unit, open abstract func i1_public_abstract_instance_member_function_1(): Unit, open abstract func i1_public_open_instance_member_function_0(): Unit, open abstract func i1_public_open_instance_member_function_1(): Unit, open abstract func i1_public_open_instance_member_function_2(): Unit]")
        arr = TypeInfo.of<I2>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open abstract func i2_public_abstract_instance_member_function_0(): Unit, open abstract func i2_public_abstract_instance_member_function_1(): Unit, open abstract func i2_public_open_instance_member_function_0(): Unit, open abstract func i2_public_open_instance_member_function_1(): Unit, open abstract func i2_public_open_instance_member_function_2(): Unit]")
        arr = TypeInfo.of<I3>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open abstract func i3_public_abstract_instance_member_function_0(): Unit, open abstract func i3_public_abstract_instance_member_function_1(): Unit, open abstract func i3_public_open_instance_member_function_0(): Unit, open abstract func i3_public_open_instance_member_function_1(): Unit, open abstract func i3_public_open_instance_member_function_2(): Unit]")
        arr = TypeInfo.of<I4>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open abstract func i4_public_abstract_instance_member_function_0(): Unit, open abstract func i4_public_abstract_instance_member_function_1(): Unit, open abstract func i4_public_open_instance_member_function_0(): Unit, open abstract func i4_public_open_instance_member_function_1(): Unit, open abstract func i4_public_open_instance_member_function_2(): Unit]")
        arr = TypeInfo.of<I5>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open abstract func i5_public_abstract_instance_member_function_0(): Unit, open abstract func i5_public_abstract_instance_member_function_1(): Unit, open abstract func i5_public_open_instance_member_function_0(): Unit, open abstract func i5_public_open_instance_member_function_1(): Unit, open abstract func i5_public_open_instance_member_function_2(): Unit]")
        arr = TypeInfo.of<I6>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open abstract func i6_public_abstract_instance_member_function_0(): Unit, open abstract func i6_public_abstract_instance_member_function_1(): Unit, open abstract func i6_public_open_instance_member_function_0(): Unit, open abstract func i6_public_open_instance_member_function_1(): Unit, open abstract func i6_public_open_instance_member_function_2(): Unit]")
    }
    @TestCase
    func testClass(): Unit {
        arr = TypeInfo.of<C0>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<C1>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[func c1_public_instance_member_function_0(Float32, MyType.myType.C1, MyType.myType.S1, Float64): Int16, func c1_public_instance_member_function_0(Float32, MyType.myType.C2, MyType.myType.I1, Float64): Int16, func c1_public_instance_member_function_1(): Int16, func c1_public_instance_member_function_2(UInt32, Rune, Float32): Int16, open func c1_public_open_instance_member_function_0(): Int16, open func c1_public_open_instance_member_function_1(): Int16]")
        arr = TypeInfo.of<C2>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[func c2_public_instance_member_function_0(): Int16, func c2_public_instance_member_function_1(): Int16, open func c2_public_open_instance_member_function_0(): Int16, open func c2_public_open_instance_member_function_1(): Int16]")
        arr = TypeInfo.of<C3>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[func c3_public_instance_member_function_0(): Int16, func c3_public_instance_member_function_1(): Int16, open abstract func c3_public_abstract_instance_member_function_0(): Int16, open abstract func c3_public_abstract_instance_member_function_1(): Int16, open abstract func c3_public_abstract_instance_member_function_2(): Int16, open func c3_public_open_instance_member_function_0(): Int16, open func c3_public_open_instance_member_function_1(): Int16]")
        arr = TypeInfo.of<C4>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[func c4_public_instance_member_function_0(): Int16, func c4_public_instance_member_function_1(): Int16, open func c4_public_open_instance_member_function_0(): Int16, open func c4_public_open_instance_member_function_1(): Int16, override func c2_public_open_instance_member_function_0(): Int16, override func c2_public_open_instance_member_function_1(): Int16]")
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        arr = TypeInfo.of<C5>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[func c5_public_instance_member_function_0(): Int16, func c5_public_instance_member_function_1(): Int16, func i1_public_abstract_instance_member_function_0(): Unit, func i1_public_abstract_instance_member_function_1(): Unit, open func c5_public_open_instance_member_function_0(): Int16, open func c5_public_open_instance_member_function_1(): Int16]")
        arr = TypeInfo.of<C6>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[func c3_public_abstract_instance_member_function_0(): Int16, func c3_public_abstract_instance_member_function_1(): Int16, func c6_public_instance_member_function_0(): Int16, func c6_public_instance_member_function_1(): Int16, open func c3_public_abstract_instance_member_function_2(): Int16, open func c6_public_open_instance_member_function_0(): Int16, open func c6_public_open_instance_member_function_1(): Int16]")
        arr = TypeInfo.of<C7<Rune, Unit, Float16, UInt16>>().instanceFunctions |>
            map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[func c7_public_instance_member_function_0(): Int16, func c7_public_instance_member_function_1(): Int16, open func c7_public_open_instance_member_function_0(): Int16, open func c7_public_open_instance_member_function_1(): Int16]")
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        arr = TypeInfo.of<C8>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[func c8_public_instance_member_function_0(): Int16, func c8_public_instance_member_function_1(): Int16, func i1_public_abstract_instance_member_function_0(): Unit, func i1_public_abstract_instance_member_function_1(): Unit, func i2_public_abstract_instance_member_function_0(): Unit, func i2_public_abstract_instance_member_function_1(): Unit, func i3_public_abstract_instance_member_function_0(): Unit, func i3_public_abstract_instance_member_function_1(): Unit, open func c8_public_open_instance_member_function_0(): Int16, open func c8_public_open_instance_member_function_1(): Int16]")
        arr = TypeInfo.of<C9>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[func c9_public_instance_member_function_0(): Int16, func c9_public_instance_member_function_1(): Int16, open func c9_public_open_instance_member_function_0(): Int16, open func c9_public_open_instance_member_function_1(): Int16]")
    }
    @TestCase
    func testStruct(): Unit {
        arr = TypeInfo.of<S0>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<S1>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[func *(Rune): String, func +(UInt32): UInt32, func s1_public_instance_member_function_0(MyType.myType.S1, Rune, UInt32, Float32): Int16, func s1_public_instance_member_function_1(): Int16]")
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        arr = TypeInfo.of<S2>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[func *(Rune): String, func +(UInt32): UInt32, func i1_public_abstract_instance_member_function_0(): Unit, func i1_public_abstract_instance_member_function_1(): Unit, func s2_public_instance_member_function_0(): Int16, func s2_public_instance_member_function_1(): Int16]")
        arr = TypeInfo.of<S3>().instanceFunctions |> map {a: InstanceFunctionInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[func *(Rune): String, func +(UInt32): UInt32, func i1_public_abstract_instance_member_function_0(): Unit, func i1_public_abstract_instance_member_function_1(): Unit, func i2_public_abstract_instance_member_function_0(): Unit, func i2_public_abstract_instance_member_function_1(): Unit, func i3_public_abstract_instance_member_function_0(): Unit, func i3_public_abstract_instance_member_function_1(): Unit, func s3_public_instance_member_function_0(): Int16, func s3_public_instance_member_function_1(): Int16]")
    }
}
