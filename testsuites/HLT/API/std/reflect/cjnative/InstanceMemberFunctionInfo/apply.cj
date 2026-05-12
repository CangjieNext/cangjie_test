/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt %compile_library -p ./MyType/src/myType -o libMyType_myType.%test_suffix
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt -o %output %f --import-path . -L. -lMyType_myType %cmp_utest_opt
// (!(target_mac | target_ios | target_ios_simulator)) RUN-EXEC: %run %run_opt %output %run_args %run_utest_opt
import std.reflect.*
import MyType.myType.*
import std.collection.*

@Test
class Test {
    @TestCase
    func test0(): Unit {
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceFunction("c1_public_instance_member_function_0", TypeInfo.of<Float32>(), TypeInfo.of<C1>(), TypeInfo.of<S1>(), TypeInfo.of<Float64>()).apply(C1(), 1.2f32, C1(), S1(), 2.3) as Int16).getOrThrow(), 12)
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceFunction("c1_public_open_instance_member_function_0").apply(C1()) as Int16).getOrThrow(), 12)

        // 传入非法实例。
        // 毫不相干。
        try {
            (TypeInfo
                .of<C1>() as ClassTypeInfo)
                .getOrThrow()
                .getInstanceFunction("c1_public_instance_member_function_2", TypeInfo.of<UInt32>(), TypeInfo.of<Rune>(),
                    TypeInfo.of<Float32>())
                .apply(1, 12, r'a');
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalArgumentException: The input parameter item does not comply with the required quantity.")
        }

        // 非子类型的 class 实例。
        try {
            (TypeInfo
                .of<C1>() as ClassTypeInfo)
                .getOrThrow()
                .getInstanceFunction("c1_public_instance_member_function_2", TypeInfo.of<UInt32>(), TypeInfo.of<Rune>(),
                    TypeInfo.of<Float32>())
                .apply(C0(), 12, r'a');
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalArgumentException: The input parameter item does not comply with the required quantity.")
        }

        // 获取父类型的实例成员函数，但却对子类型的实例调用。
        try {
            (TypeInfo
                .of<C2>() as ClassTypeInfo)
                .getOrThrow()
                .getInstanceFunction("c2_public_open_instance_member_function_0")
                .apply(C4());
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalTypeException: The input instance should be \"MyType.myType.C2\", but now it`s \"MyType.myType.C4\"")
        }

        // 实参数目不等。
        try {
            (TypeInfo
                .of<C1>() as ClassTypeInfo)
                .getOrThrow()
                .getInstanceFunction("c1_public_instance_member_function_2", TypeInfo.of<UInt32>(), TypeInfo.of<Rune>(),
                    TypeInfo.of<Float32>())
                .apply(C1(), 12, r'a');
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalArgumentException: The input parameter item does not comply with the required quantity.")
        }

        // 实参类型不匹配。
        try {
            (TypeInfo
                .of<C1>() as ClassTypeInfo)
                .getOrThrow()
                .getInstanceFunction("c1_public_instance_member_function_2", TypeInfo.of<UInt32>(), TypeInfo.of<Rune>(),
                    TypeInfo.of<Float32>())
                .apply(C1(), 12, "kiki", 1.2);
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalTypeException: The input parameter does not match the type of the input parameter required by the function.")
        }

        // 试图调用抽象实例成员函数。
        try {
            (TypeInfo
                .of<C3>() as ClassTypeInfo)
                .getOrThrow()
                .getInstanceFunction("c3_public_abstract_instance_member_function_0")
                .apply(C6());
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "InvocationTargetException: The abstract function cannot be applied.")
        }

        // 实例成员函数内部抛出异常。
        try {
            (TypeInfo
                .of<C1>() as ClassTypeInfo)
                .getOrThrow()
                .getInstanceFunction("c1_public_instance_member_function_1")
                .apply(C1());
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "Exception: exception from instance member function")
        }
    }
    @TestCase
    func testStruct(): Unit {
        // struct 不支持。
        // @Expect(((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getInstanceFunction("s1_public_instance_member_function_0").apply(S1()) as Int16).getOrThrow(), 12)
    }
}
