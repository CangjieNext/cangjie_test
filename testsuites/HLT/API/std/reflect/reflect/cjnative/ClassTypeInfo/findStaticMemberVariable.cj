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
    @TestCase
    func testClass(): Unit {
        try {
            (TypeInfo
                .of<C0>() as ClassTypeInfo)
                .getOrThrow()
                .getStaticVariable("c0_public_mutable_static_member_variable_0")
            @Assert(false)
        } catch (e: Exception) {
        }
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getStaticVariable("c1_public_mutable_static_member_variable_0").toString(), "static c1_public_mutable_static_member_variable_0: String")
        @Expect((TypeInfo.of<C2>() as ClassTypeInfo).getOrThrow().getStaticVariable("c2_public_mutable_static_member_variable_0").toString(), "static c2_public_mutable_static_member_variable_0: String")
        @Expect((TypeInfo.of<C3>() as ClassTypeInfo).getOrThrow().getStaticVariable("c3_public_mutable_static_member_variable_0").toString(), "static c3_public_mutable_static_member_variable_0: String")
        @Expect((TypeInfo.of<C4>() as ClassTypeInfo).getOrThrow().getStaticVariable("c4_public_mutable_static_member_variable_0").toString(), "static c4_public_mutable_static_member_variable_0: String")
        @Expect((TypeInfo.of<C5>() as ClassTypeInfo).getOrThrow().getStaticVariable("c5_public_mutable_static_member_variable_0").toString(), "static c5_public_mutable_static_member_variable_0: String")
        @Expect((TypeInfo.of<C6>() as ClassTypeInfo).getOrThrow().getStaticVariable("c6_public_mutable_static_member_variable_0").toString(), "static c6_public_mutable_static_member_variable_0: String")
        @Expect((TypeInfo.of<C8>() as ClassTypeInfo).getOrThrow().getStaticVariable("c8_public_mutable_static_member_variable_0").toString(), "static c8_public_mutable_static_member_variable_0: String")
        @Expect((TypeInfo.of<C9>() as ClassTypeInfo).getOrThrow().getStaticVariable("c9_public_mutable_static_member_variable_0").toString(), "static c9_public_mutable_static_member_variable_0: String")
    }
}
