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
// (not MAC) RUN-EXEC: %cp ./MyType/libMyType_myType.%test_suffix .&& %run %run_opt %output %run_args

import std.reflect.*
import MyType.myType.*

@Test
class Test {
    @TestCase
    func testC1(): Unit {
        // 普通 class 类型的实例成员函数。
        @Expect(TypeInfo.of<C1>().getInstanceFunction("c1_public_instance_member_function_0", TypeInfo.of<Float32>(), TypeInfo.of<C1>(), TypeInfo.of<S1>(), TypeInfo.of<Float64>()).annotations.size, 6)
        // 普通 class 类型的实例成员变量。
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c1_public_mutable_instance_member_variable_0").annotations.size, 6)
        @Expect((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getInstanceVariable("s1_public_mutable_instance_member_variable_0").annotations.size, 6)
        @Expect(TypeInfo.of<C1>().getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).annotations.size, 6)
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getStaticVariable("c1_public_mutable_static_member_variable_0").annotations.size, 6)
        @Expect((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getStaticVariable("s1_public_readonly_static_member_variable_0").annotations.size, 6)
        @Expect((TypeInfo.of<A1>() as ClassTypeInfo).getOrThrow().getStaticVariable("a1_public_readonly_static_member_variable_0").annotations.size, 6)
        @Expect(TypeInfo.of<C1>().getStaticProperty("c1_public_mutable_static_member_property_0").annotations.size, 6)
        @Expect(TypeInfo.of<S1>().getStaticProperty("s1_public_mutable_static_member_property_0").annotations.size, 6)
        @Expect(TypeInfo.of<I1>().getStaticProperty("i1_public_readonly_static_member_property_0").annotations.size, 6)
        @Expect(TypeInfo.of<I1>().getStaticProperty("i1_public_abstract_readonly_static_member_property_0").annotations.size, 6)
        @Expect(TypeInfo.of<I0>().annotations.size, 6)
        @Expect(TypeInfo.of<I1>().annotations.size, 6)
        @Expect(TypeInfo.of<C0>().annotations.size, 6)
        @Expect(TypeInfo.of<C1>().annotations.size, 6)
        @Expect(TypeInfo.of<S0>().annotations.size, 6)
        @Expect(TypeInfo.of<S1>().annotations.size, 6)
        @Expect(TypeInfo.of<C1>().getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).parameters[0].annotations.size, 6)
        @Expect(TypeInfo.of<C1>().getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).parameters[1].annotations.size, 6)
        @Expect(TypeInfo.of<C1>().getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).parameters[2].annotations.size, 6)
        @Expect(TypeInfo.of<C1>().getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).parameters[3].annotations.size, 6)
        // 空 class 的默认构造函数。
        @Expect((TypeInfo.of<C0>() as ClassTypeInfo).getOrThrow().getConstructor().annotations.size, 0)
        // 普通 class 的构造函数。
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor().annotations.size, 6)
        // 抽象 class 的构造函数。
        @Expect((TypeInfo.of<C3>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Bool>(), TypeInfo.of<Rune>()).annotations.size, 6)
        // 开发 class 的构造函数。
        @Expect((TypeInfo.of<C2>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Bool>(), TypeInfo.of<Rune>()).annotations.size, 6)
        // 空 struct 的默认构造函数。
        @Expect((TypeInfo.of<S0>() as StructTypeInfo).getOrThrow().getConstructor().annotations.size, 0)
        // 普通 struct 的构造函数。
        @Expect((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getConstructor().annotations.size, 6)
        @Expect((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Int8>(), TypeInfo.of<Rune>()).annotations.size, 6)
        @Expect((TypeInfo.of<A0>() as ClassTypeInfo).getOrThrow().getConstructor().annotations.size, 6)
        @Expect((TypeInfo.of<A1>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Int64>()).annotations.size, 6)
        // 抽象的实例成员函数。
        @Expect(TypeInfo.of<C3>().getInstanceFunction("c3_public_abstract_instance_member_function_0").annotations.size, 6)
        // 覆盖父类的实例成员函数。
        @Expect(TypeInfo.of<C4>().getInstanceFunction("c2_public_open_instance_member_function_0").annotations.size, 6)
        // 普通 interface 的实例成员函数。
        @Expect(TypeInfo.of<C5>().getInstanceFunction("i1_public_abstract_instance_member_function_0").annotations.size, 6)

        // class 从 interface 继承而来的非抽象的实例成员函数。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<C5>().getInstanceFunction("i1_public_open_instance_member_function_0").annotations.size, 6)
        // class 从 interface 继承而来的非抽象的静态成员函数。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<C5>().getStaticFunction("i1_public_open_static_member_function_0").annotations.size, 6)
        // class 从 interface 继承而来的非抽象的实例成员属性。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<C5>().getInstanceProperty("i1_public_mutable_member_property_0").annotations.size, 6)

        // class 从 interface 继承而来的非抽象的静态成员属性。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<C5>().getStaticProperty("i1_public_mutable_static_member_property_0").annotations.size, 6)

        // interface 从 interface 继承而来的非抽象的静态成员属性。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<I4>().getStaticProperty("i1_public_mutable_static_member_property_0").annotations.size, 6)

        // interface 从 interface 继承而来的非抽象的静态成员函数。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<I4>().getStaticFunction("i1_public_open_static_member_function_0").annotations.size, 6)

        // struct 从 interface 继承而来的非抽象的静态成员属性。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<S2>().getStaticProperty("i1_public_mutable_static_member_property_0").annotations.size, 6)

        // struct 从 interface 继承而来的非抽象的静态成员函数。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<S2>().getStaticFunction("i1_public_open_static_member_function_0").annotations.size, 6)

        // struct 从 interface 继承而来的非抽象的实例成员属性。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<S2>().getInstanceProperty("i1_public_mutable_member_property_0").annotations.size, 6)

        // struct 从 interface 继承而来的非抽象的实例成员函数。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<S2>().getInstanceFunction("i1_public_open_instance_member_function_0").annotations.size, 6)
        // 普通 struct 类型的实例成员函数。
        @Expect(TypeInfo.of<S1>().getInstanceFunction("s1_public_instance_member_function_0", TypeInfo.of<S1>(), TypeInfo.of<Rune>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()).annotations.size, 6)
        // 非抽象实例成员函数。
        @Expect(TypeInfo.of<I1>().getInstanceFunction("i1_public_open_instance_member_function_0").annotations.size, 6)
        // 抽象实例成员函数。
        @Expect(TypeInfo.of<I1>().getInstanceFunction("i1_public_abstract_instance_member_function_0").annotations.size, 6)
        // 普通注解类的实例成员变量。
        @Expect(TypeInfo.of<A1>().getInstanceFunction("a1_public_open_instance_member_function_0").annotations.size, 6)
    }
}
