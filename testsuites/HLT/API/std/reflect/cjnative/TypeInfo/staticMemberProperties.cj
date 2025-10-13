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
        @Expect(TypeInfo.of<Int8>().staticProperties.isEmpty())
        @Expect(TypeInfo.of<Int16>().staticProperties.isEmpty())
        @Expect(TypeInfo.of<Int32>().staticProperties.isEmpty())
        @Expect(TypeInfo.of<Int64>().staticProperties.isEmpty())
        @Expect(TypeInfo.of<IntNative>().staticProperties.isEmpty())
        @Expect(TypeInfo.of<UInt8>().staticProperties.isEmpty())
        @Expect(TypeInfo.of<UInt16>().staticProperties.isEmpty())
        @Expect(TypeInfo.of<UInt32>().staticProperties.isEmpty())
        @Expect(TypeInfo.of<UInt64>().staticProperties.isEmpty())
        @Expect(TypeInfo.of<UIntNative>().staticProperties.isEmpty())
        @Expect(TypeInfo.of<Float16>().staticProperties.isEmpty())
        @Expect(TypeInfo.of<Float32>().staticProperties.isEmpty())
        @Expect(TypeInfo.of<Float64>().staticProperties.isEmpty())
        @Expect(TypeInfo.of<Bool>().staticProperties.isEmpty())
        @Expect(TypeInfo.of<Rune>().staticProperties.isEmpty())
    }
    @TestCase
    func testInterface(): Unit {
        arr = TypeInfo.of<I0>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<I1>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[abstract static mut prop i1_public_abstract_mutable_static_member_property_0: Int64, abstract static mut prop i1_public_mutable_static_member_property_0: Int64, abstract static prop i1_public_abstract_readonly_static_member_property_0: Int64, abstract static prop i1_public_readonly_static_member_property_0: Int64]")
        arr = TypeInfo.of<I2>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[abstract static mut prop i2_public_abstract_mutable_static_member_property_0: Int64, abstract static mut prop i2_public_mutable_static_member_property_0: Int64, abstract static prop i2_public_abstract_readonly_static_member_property_0: Int64, abstract static prop i2_public_readonly_static_member_property_0: Int64]")
        arr = TypeInfo.of<I3>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[abstract static mut prop i3_public_abstract_mutable_static_member_property_0: Int64, abstract static mut prop i3_public_mutable_static_member_property_0: Int64, abstract static prop i3_public_abstract_readonly_static_member_property_0: Int64, abstract static prop i3_public_readonly_static_member_property_0: Int64]")
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        arr = TypeInfo.of<I4>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[abstract static mut prop i4_public_abstract_mutable_static_member_property_0: Int64, abstract static mut prop i4_public_mutable_static_member_property_0: Int64, abstract static prop i4_public_abstract_readonly_static_member_property_0: Int64, abstract static prop i4_public_readonly_static_member_property_0: Int64]")
    }
    @TestCase
    func testClass(): Unit {
        arr = TypeInfo.of<C0>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<C1>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static mut prop c1_public_mutable_static_member_property_0: Int8, static prop c1_public_readonly_static_member_property_0: String]")
        arr = TypeInfo.of<C2>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static mut prop c2_public_mutable_static_member_property_0: Int8, static prop c2_public_readonly_static_member_property_0: String]")
        arr = TypeInfo.of<C3>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static mut prop c3_public_mutable_static_member_property_0: Int8, static prop c3_public_readonly_static_member_property_0: String]")
        arr = TypeInfo.of<C4>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static mut prop c4_public_mutable_static_member_property_0: Int8, static prop c4_public_readonly_static_member_property_0: String]")
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        arr = TypeInfo.of<C5>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static mut prop c5_public_mutable_static_member_property_0: Int8, static mut prop i1_public_abstract_mutable_static_member_property_0: Int64, static prop c5_public_readonly_static_member_property_0: String, static prop i1_public_abstract_readonly_static_member_property_0: Int64]")
        arr = TypeInfo.of<C6>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static mut prop c6_public_mutable_static_member_property_0: Int8, static prop c6_public_readonly_static_member_property_0: String]")
        // 带泛型的class目前会segfault。
    }
    @TestCase
    func testStruct(): Unit {
        arr = TypeInfo.of<S0>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<S1>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static mut prop s1_public_mutable_static_member_property_0: Int8, static prop s1_public_readonly_static_member_property_0: Int8]")
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        arr = TypeInfo.of<S2>().staticProperties |> map {a: StaticPropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static mut prop i1_public_abstract_mutable_static_member_property_0: Int64, static mut prop s2_public_mutable_static_member_property_0: Int8, static prop i1_public_abstract_readonly_static_member_property_0: Int64, static prop s2_public_readonly_static_member_property_0: Int8]")
    }
}
