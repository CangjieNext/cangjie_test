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
import MyType.myType

@Test
class Test {
    @TestCase
    func test(): Unit {
        @Expect((TypeInfo.of<C1>().getInstanceProperty("c1_public_mutable_instance_member_property_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<S1>().getInstanceProperty("s1_public_mutable_instance_member_property_0").findAnnotation<myType.A2>().getOrThrow() as A2).getOrThrow().a2_public_readonly_instance_member_variable_0, 12)
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).parameters[0].findAnnotation<myType.A0>().getOrThrow() as A0).isSome())
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).parameters[0].findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<C1>().getInstanceFunction("c1_public_instance_member_function_0", TypeInfo.of<Float32>(), TypeInfo.of<C1>(), TypeInfo.of<S1>(), TypeInfo.of<Float64>()).findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<S1>().getInstanceFunction("s1_public_instance_member_function_0", TypeInfo.of<S1>(), TypeInfo.of<Rune>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()).findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<A1>().getInstanceFunction("a1_public_open_instance_member_function_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        // String std.core::String bug。
        // @Expect((TypeInfo.of<A1>().getInstanceFunction("a1_public_open_instance_member_function_0").findAnnotation<myType.A4<Float64, Rune, String, Int64>>().getOrThrow() as A4<Float64, Rune, String, Int64>).a4_public_readonly_instance_member_variable_2, "hello")
        @Expect((TypeInfo.of<I1>().getInstanceFunction("i1_public_open_instance_member_function_0").findAnnotation<myType.A3>().getOrThrow() as A3).getOrThrow().a3_public_readonly_instance_member_variable_0, 12)
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c1_public_mutable_instance_member_variable_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect(((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getInstanceVariable("s1_public_mutable_instance_member_variable_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect(TypeInfo.of<C1>().getInstanceProperty("c1_public_mutable_instance_member_property_0").annotations.size, 6)
        @Expect((TypeInfo.of<C1>().getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getStaticVariable("c1_public_mutable_static_member_variable_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect(((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getStaticVariable("s1_public_readonly_static_member_variable_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect(((TypeInfo.of<A1>() as ClassTypeInfo).getOrThrow().getStaticVariable("a1_public_readonly_static_member_variable_0").findAnnotation<myType.A2>().getOrThrow() as A2).getOrThrow().a2_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<C1>().getStaticProperty("c1_public_mutable_static_member_property_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<S1>().getStaticProperty("s1_public_mutable_static_member_property_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<I1>().getStaticProperty("i1_public_readonly_static_member_property_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<I1>().getStaticProperty("i1_public_abstract_readonly_static_member_property_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<A1>().getStaticProperty("a1_public_mutable_static_member_property_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<C1>().getStaticProperty("c1_public_mutable_static_member_property_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<S1>().getStaticProperty("s1_public_mutable_static_member_property_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<I1>().getStaticProperty("i1_public_readonly_static_member_property_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<I1>().getStaticProperty("i1_public_abstract_readonly_static_member_property_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<A1>().getStaticProperty("a1_public_mutable_static_member_property_0").findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor().findAnnotation<myType.A0>().getOrThrow() as A0).isSome())
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor().findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Int64>()).findAnnotation<myType.A0>().getOrThrow() as A0).isSome())
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Int64>()).findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect(((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getConstructor().findAnnotation<myType.A0>().getOrThrow() as A0).isSome())
        @Expect(((TypeInfo.of<A1>() as ClassTypeInfo).getOrThrow().getConstructor().findAnnotation<myType.A0>().getOrThrow() as A0).isSome())
        @Expect(((TypeInfo.of<A1>() as ClassTypeInfo).getOrThrow().getConstructor().findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<I0>().findAnnotation<myType.A0>().getOrThrow() as A0).isSome())
        @Expect((TypeInfo.of<I0>().findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<I1>().findAnnotation<myType.A0>().getOrThrow() as A0).isSome())
        @Expect((TypeInfo.of<I1>().findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<C0>().findAnnotation<myType.A0>().getOrThrow() as A0).isSome())
        @Expect((TypeInfo.of<C0>().findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<C1>().findAnnotation<myType.A0>().getOrThrow() as A0).isSome())
        @Expect((TypeInfo.of<C1>().findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<S0>().findAnnotation<myType.A0>().getOrThrow() as A0).isSome())
        @Expect((TypeInfo.of<S0>().findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
        @Expect((TypeInfo.of<A0>().findAnnotation<myType.A0>().getOrThrow() as A0).isSome())
        @Expect((TypeInfo.of<A0>().findAnnotation<myType.A1>().getOrThrow() as A1).getOrThrow().a1_public_readonly_instance_member_variable_0, 12)
    }
}
