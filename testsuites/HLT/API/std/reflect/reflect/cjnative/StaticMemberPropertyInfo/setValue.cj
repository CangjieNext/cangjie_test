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

@Test
class Test {
    @TestCase
    func testClass(): Unit {
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getStaticProperty("c1_public_mutable_static_member_property_0").getValue() as Int8).getOrThrow(), 12)
        (TypeInfo
            .of<C1>() as ClassTypeInfo)
            .getOrThrow()
            .getStaticProperty("c1_public_mutable_static_member_property_0")
            .setValue(13i8)
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getStaticProperty("c1_public_mutable_static_member_property_0").getValue() as Int8).getOrThrow(), 13)

        // 新值类型不匹配。
        try {
            (TypeInfo
                .of<C1>() as ClassTypeInfo)
                .getOrThrow()
                .getStaticProperty("c1_public_mutable_static_member_property_0")
                .setValue("hello");
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalTypeException: The input parameter does not match the type of the input parameter required by the function.")
        }
        // 尝试修改不可变静态成员属性。
        try {
            (TypeInfo
                .of<C1>() as ClassTypeInfo)
                .getOrThrow()
                .getStaticProperty("c1_public_readonly_static_member_property_0")
                .setValue("world");
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalSetException: Attempt to modify immutable property 'c1_public_readonly_static_member_property_0'")
        }
    }
    @TestCase
    func testStruct(): Unit {
        @Expect(((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getStaticProperty("s1_public_mutable_static_member_property_0").getValue() as Int8).getOrThrow(), 12)
        (TypeInfo
            .of<S1>() as StructTypeInfo)
            .getOrThrow()
            .getStaticProperty("s1_public_mutable_static_member_property_0")
            .setValue(13i8)
        @Expect(((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getStaticProperty("s1_public_mutable_static_member_property_0").getValue() as Int8).getOrThrow(), 13)

        // 新值类型不匹配。
        try {
            (TypeInfo
                .of<S1>() as StructTypeInfo)
                .getOrThrow()
                .getStaticProperty("s1_public_mutable_static_member_property_0")
                .setValue("123")
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalTypeException: The input parameter does not match the type of the input parameter required by the function.")
        }
        // 尝试修改不可变静态成员属性。
        try {
            (TypeInfo
                .of<S1>() as StructTypeInfo)
                .getOrThrow()
                .getStaticProperty("s1_public_readonly_static_member_property_0")
                .setValue(13)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalSetException: Attempt to modify immutable property 's1_public_readonly_static_member_property_0'")
        }
    }
}
