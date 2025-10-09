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
        @Expect(TypeInfo.of<Int8>().instanceProperties.isEmpty())
        @Expect(TypeInfo.of<Int16>().instanceProperties.isEmpty())
        @Expect(TypeInfo.of<Int32>().instanceProperties.isEmpty())
        @Expect(TypeInfo.of<Int64>().instanceProperties.isEmpty())
        @Expect(TypeInfo.of<IntNative>().instanceProperties.isEmpty())
        @Expect(TypeInfo.of<UInt8>().instanceProperties.isEmpty())
        @Expect(TypeInfo.of<UInt16>().instanceProperties.isEmpty())
        @Expect(TypeInfo.of<UInt32>().instanceProperties.isEmpty())
        @Expect(TypeInfo.of<UInt64>().instanceProperties.isEmpty())
        @Expect(TypeInfo.of<UIntNative>().instanceProperties.isEmpty())
        @Expect(TypeInfo.of<Float16>().instanceProperties.isEmpty())
        @Expect(TypeInfo.of<Float32>().instanceProperties.isEmpty())
        @Expect(TypeInfo.of<Float64>().instanceProperties.isEmpty())
        @Expect(TypeInfo.of<Bool>().instanceProperties.isEmpty())
        @Expect(TypeInfo.of<Rune>().instanceProperties.isEmpty())
    }
    @TestCase
    func testInterface(): Unit {
        arr = TypeInfo.of<I0>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<I1>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open abstract mut prop i1_public_abstract_mutable_instance_member_property_0: Int8, open abstract mut prop i1_public_abstract_mutable_instance_member_property_1: Int8, open abstract mut prop i1_public_mutable_member_property_0: Int8, open abstract mut prop i1_public_mutable_member_property_1: Int8, open abstract prop i1_public_abstract_readonly_instance_member_property_0: String, open abstract prop i1_public_abstract_readonly_instance_member_property_1: String, open abstract prop i1_public_abstract_readonly_instance_member_property_2: String, open abstract prop i1_public_readonly_instance_member_property_0: String]")
        arr = TypeInfo.of<I2>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open abstract mut prop i2_public_abstract_mutable_instance_member_property_0: Int8, open abstract mut prop i2_public_abstract_mutable_instance_member_property_1: Int8, open abstract mut prop i2_public_mutable_member_property_0: Int8, open abstract mut prop i2_public_mutable_member_property_1: Int8, open abstract prop i2_public_abstract_readonly_instance_member_property_0: String, open abstract prop i2_public_abstract_readonly_instance_member_property_1: String, open abstract prop i2_public_abstract_readonly_instance_member_property_2: String, open abstract prop i2_public_readonly_instance_member_property_0: String]")
        arr = TypeInfo.of<I3>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open abstract mut prop i3_public_abstract_mutable_instance_member_property_0: Int8, open abstract mut prop i3_public_abstract_mutable_instance_member_property_1: Int8, open abstract mut prop i3_public_mutable_member_property_0: Int8, open abstract mut prop i3_public_mutable_member_property_1: Int8, open abstract prop i3_public_abstract_readonly_instance_member_property_0: String, open abstract prop i3_public_abstract_readonly_instance_member_property_1: String, open abstract prop i3_public_abstract_readonly_instance_member_property_2: String, open abstract prop i3_public_readonly_instance_member_property_0: String]")
        arr = TypeInfo.of<I4>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open abstract mut prop i4_public_abstract_mutable_instance_member_property_0: Int8, open abstract mut prop i4_public_abstract_mutable_instance_member_property_1: Int8, open abstract mut prop i4_public_mutable_member_property_0: Int8, open abstract mut prop i4_public_mutable_member_property_1: Int8, open abstract prop i4_public_abstract_readonly_instance_member_property_0: String, open abstract prop i4_public_abstract_readonly_instance_member_property_1: String, open abstract prop i4_public_abstract_readonly_instance_member_property_2: String, open abstract prop i4_public_readonly_instance_member_property_0: String]")
        arr = TypeInfo.of<I5>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open abstract mut prop i5_public_abstract_mutable_instance_member_property_0: Int8, open abstract mut prop i5_public_abstract_mutable_instance_member_property_1: Int8, open abstract mut prop i5_public_mutable_member_property_0: Int8, open abstract mut prop i5_public_mutable_member_property_1: Int8, open abstract prop i5_public_abstract_readonly_instance_member_property_0: String, open abstract prop i5_public_abstract_readonly_instance_member_property_1: String, open abstract prop i5_public_abstract_readonly_instance_member_property_2: String, open abstract prop i5_public_readonly_instance_member_property_0: String]")
        arr = TypeInfo.of<I6>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[open abstract mut prop i6_public_abstract_mutable_instance_member_property_0: Int8, open abstract mut prop i6_public_abstract_mutable_instance_member_property_1: Int8, open abstract mut prop i6_public_mutable_member_property_0: Int8, open abstract mut prop i6_public_mutable_member_property_1: Int8, open abstract prop i6_public_abstract_readonly_instance_member_property_0: String, open abstract prop i6_public_abstract_readonly_instance_member_property_1: String, open abstract prop i6_public_abstract_readonly_instance_member_property_2: String, open abstract prop i6_public_readonly_instance_member_property_0: String]")
    }
    @TestCase
    func testClass(): Unit {
        arr = TypeInfo.of<C0>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<C1>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[mut prop c1_public_mutable_instance_member_property_0: Int8, open mut prop c1_public_open_mutable_instance_member_property_0: Int8, open prop c1_public_open_readonly_instance_member_property_0: String, prop c1_public_readonly_instance_member_property_0: String]")
        arr = TypeInfo.of<C2>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[mut prop c2_public_mutable_instance_member_property_0: Int8, prop c2_public_readonly_instance_member_property_0: String]")
        arr = TypeInfo.of<C3>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[mut prop c3_public_mutable_instance_member_property_0: Int8, open abstract mut prop c3_public_abstract_mutable_instance_member_property_0: Int8, open abstract prop c3_public_abstract_readonly_instance_member_property_0: String, open mut prop c3_public_open_mutable_instance_member_property_0: Int8, open prop c3_public_open_readonly_instance_member_property_0: String, prop c3_public_readonly_instance_member_property_0: String]")
        arr = TypeInfo.of<C4>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[mut prop c4_public_mutable_instance_member_property_0: Int8, open mut prop c4_public_open_mutable_instance_member_property_0: Int8, open prop c4_public_open_readonly_instance_member_property_0: String, prop c4_public_readonly_instance_member_property_0: String]")
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        arr = TypeInfo.of<C5>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[mut prop c5_public_mutable_instance_member_property_0: Int8, mut prop i1_public_abstract_mutable_instance_member_property_0: Int8, mut prop i1_public_abstract_mutable_instance_member_property_1: Int8, open mut prop c5_public_open_mutable_instance_member_property_0: Int8, open prop c5_public_open_readonly_instance_member_property_0: String, prop c5_public_readonly_instance_member_property_0: String, prop i1_public_abstract_readonly_instance_member_property_0: String, prop i1_public_abstract_readonly_instance_member_property_1: String, prop i1_public_abstract_readonly_instance_member_property_2: String]")
        arr = TypeInfo.of<C6>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[mut prop c3_public_abstract_mutable_instance_member_property_0: Int8, mut prop c6_public_mutable_instance_member_property_0: Int8, open mut prop c6_public_open_mutable_instance_member_property_0: Int8, open prop c6_public_open_readonly_instance_member_property_0: String, prop c3_public_abstract_readonly_instance_member_property_0: String, prop c6_public_readonly_instance_member_property_0: String]")
        // arr = TypeInfo.of<C7<String, Float32, Unit, ArrayList<Int64>>>().instanceProperties |> map { a: InstancePropertyInfo => a.toString() } |> collectArray; arr.sort(); @Expect(arr.toString(), "[///]")
    }
    @TestCase
    func testStruct(): Unit {
        arr = TypeInfo.of<S0>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = TypeInfo.of<S1>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[mut prop s1_public_mutable_instance_member_property_0: Int8, prop s1_public_readonly_instance_member_property_0: Int8]")
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        arr = TypeInfo.of<S2>().instanceProperties |> map {a: InstancePropertyInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[mut prop i1_public_abstract_mutable_instance_member_property_0: Int8, mut prop i1_public_abstract_mutable_instance_member_property_1: Int8, mut prop s2_public_mutable_instance_member_property_0: Int8, prop i1_public_abstract_readonly_instance_member_property_0: String, prop i1_public_abstract_readonly_instance_member_property_1: String, prop i1_public_abstract_readonly_instance_member_property_2: String, prop s2_public_readonly_instance_member_property_0: Int8]")
    }
}
