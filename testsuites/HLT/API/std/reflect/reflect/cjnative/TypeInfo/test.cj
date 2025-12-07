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

@Test
class Test {
    // 函数形参的注解。
    @TestCase
    func test0(): Unit {
        // 1 主构造函数的形参。
        // 1.1 class主构造函数的形参。
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Int64>(), TypeInfo.of<String>(), TypeInfo.of<Int64>(), TypeInfo.of<String>()).parameters[0].annotations.size, 6)
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Int64>(), TypeInfo.of<String>(), TypeInfo.of<Int64>(), TypeInfo.of<String>()).parameters[1].annotations.size, 6)
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Int64>(), TypeInfo.of<String>(), TypeInfo.of<Int64>(), TypeInfo.of<String>()).parameters[2].annotations.size, 0)
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Int64>(), TypeInfo.of<String>(), TypeInfo.of<Int64>(), TypeInfo.of<String>()).parameters[3].annotations.size, 0)

        // 1.2 struct主构造函数的形参。
        // TODO

        // 1.3 注解类主构造函数的形参。
        // TODO

        // 2 实例成员函数的形参。
        // 2.1 class实例成员函数的形参。
        @Expect(TypeInfo.of<C1>().getInstanceFunction("c1_public_instance_member_function_2", TypeInfo.of<UInt32>(), TypeInfo.of<Rune>(), TypeInfo.of<Float32>()).parameters[0].annotations.size, 6)
        @Expect(TypeInfo.of<C1>().getInstanceFunction("c1_public_instance_member_function_2", TypeInfo.of<UInt32>(), TypeInfo.of<Rune>(), TypeInfo.of<Float32>()).parameters[1].annotations.size, 6)
        @Expect(TypeInfo.of<C1>().getInstanceFunction("c1_public_instance_member_function_2", TypeInfo.of<UInt32>(), TypeInfo.of<Rune>(), TypeInfo.of<Float32>()).parameters[2].annotations.size, 6)
        // 2.2 interface实例成员函数的形参。
        // 2.3 struct实例成员函数的形参。
        // 2.4 注解类实例成员函数的形参。
        // 3 静态成员函数的形参。
        // 3.1 class的静态成员函数的形参。
        @Expect(TypeInfo.of<C1>().getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).parameters[0].annotations.size, 6)
        @Expect(TypeInfo.of<C1>().getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).parameters[1].annotations.size, 6)
        @Expect(TypeInfo.of<C1>().getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).parameters[2].annotations.size, 6)
        @Expect(TypeInfo.of<C1>().getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).parameters[3].annotations.size, 6)
    }
    // 实例成员函数的注解。
    @TestCase
    func test1(): Unit {
        // class。
        // 普通 class 类型的实例成员函数。
        @Expect(TypeInfo.of<C1>().getInstanceFunction("c1_public_instance_member_function_0", TypeInfo.of<Float32>(), TypeInfo.of<C1>(), TypeInfo.of<S1>(), TypeInfo.of<Float64>()).annotations.size, 6)
        // 抽象的实例成员函数。
        @Expect(TypeInfo.of<C3>().getInstanceFunction("c3_public_abstract_instance_member_function_0").annotations.size, 6)
        // 覆盖父类的实例成员函数。
        @Expect(TypeInfo.of<C4>().getInstanceFunction("c2_public_open_instance_member_function_0").annotations.size, 6)
        // 普通 interface 的实例成员函数。
        @Expect(TypeInfo.of<C5>().getInstanceFunction("i1_public_abstract_instance_member_function_0").annotations.size, 6)
        // class 从 interface 继承而来的非抽象的实例成员函数。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<C5>().getInstanceFunction("i1_public_open_instance_member_function_0").annotations.size, 6)

        // interface。
        // interface中定义的非抽象实例成员函数。
        @Expect(TypeInfo.of<I1>().getInstanceFunction("i1_public_open_instance_member_function_0").annotations.size, 6)
        // interface中定义的抽象实例成员函数。
        @Expect(TypeInfo.of<I1>().getInstanceFunction("i1_public_abstract_instance_member_function_0").annotations.size, 6)

        // 注解类。
        // 注解类中定义的实例成员函数。
        @Expect(TypeInfo.of<A1>().getInstanceFunction("a1_public_open_instance_member_function_0").annotations.size, 6)
    }
    // 静态成员函数的注解。
    @TestCase
    func test2(): Unit {
        @Expect(TypeInfo.of<C1>().getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).annotations.size, 6)
        // class 从 interface 继承而来的非抽象的静态成员函数。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<C5>().getStaticFunction("i1_public_open_static_member_function_0").annotations.size, 6)

        // interface 从 interface 继承而来的非抽象的静态成员函数。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<I4>().getStaticFunction("i1_public_open_static_member_function_0").annotations.size, 6)
    }
    // 实例成员变量的注解。
    @TestCase
    func test3(): Unit {
        // 由主构造函数生成的实例成员变量。
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c1_public_primary_constructor_instance_member_variable_0").annotations.size, 6)
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c1_public_primary_constructor_instance_member_variable_1").annotations.size, 6)
        // @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c1_public_primary_constructor_instance_member_variable_2").annotations.size, 6)
        // @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c1_public_primary_constructor_instance_member_variable_3").annotations.size, 6)

        // 普通 class 类型的实例成员变量。
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c1_public_mutable_instance_member_variable_0").annotations.size, 6)
    }
    // 静态成员变量的注解。
    @TestCase
    func test4(): Unit {
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getStaticVariable("c1_public_mutable_static_member_variable_0").annotations.size, 6)
        @Expect((TypeInfo.of<A1>() as ClassTypeInfo).getOrThrow().getStaticVariable("a1_public_readonly_static_member_variable_0").annotations.size, 6)
    }
    // 构造函数的注解。
    @TestCase
    func test5(): Unit {
        // 1 主构造函数。
        // 1.1 class主构造函数。
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Int64>(), TypeInfo.of<String>(), TypeInfo.of<Int64>(), TypeInfo.of<String>()).annotations.size, 6)

        // 1.2 注解类主构造函数。
        // TODO

        // 2 构造函数。
        // 2.1 class构造函数。
        // 空 class 的默认构造函数。
        @Expect((TypeInfo.of<C0>() as ClassTypeInfo).getOrThrow().getConstructor().annotations.size, 0)
        // 普通 class 的构造函数。
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor().annotations.size, 6)
        // 抽象 class 的构造函数。
        @Expect((TypeInfo.of<C3>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Bool>(), TypeInfo.of<Rune>()).annotations.size, 6)
        // 开发 class 的构造函数。
        @Expect((TypeInfo.of<C2>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Bool>(), TypeInfo.of<Rune>()).annotations.size, 6)
        // 空 struct 的默认构造函数。
        // 普通 struct 的构造函数。
        @Expect((TypeInfo.of<A0>() as ClassTypeInfo).getOrThrow().getConstructor().annotations.size, 6)
        @Expect((TypeInfo.of<A1>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Int64>()).annotations.size, 6)
    }
    // 实例成员属性的注解。
    @TestCase
    func test9(): Unit {
        // class 从 interface 继承而来的非抽象的实例成员属性。

    }
    // 静态成员属性的注解。
    @TestCase
    func test8(): Unit {
        // class 从 interface 继承而来的非抽象的静态成员属性。
        // interface 从 interface 继承而来的非抽象的静态成员属性。
    }
    // interface类型。
    @TestCase
    func test6(): Unit {
        @Expect(TypeInfo.of<I0>().annotations.size, 6)
        @Expect(TypeInfo.of<I1>().annotations.size, 6)
    }
    // class类型。
    func test7(): Unit {
        @Expect(TypeInfo.of<C0>().annotations.size, 6)
        @Expect(TypeInfo.of<C1>().annotations.size, 6)
    }
    // struct类型。
    func test10(): Unit {
    }
}
