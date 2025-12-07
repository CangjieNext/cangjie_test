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
                .getInstanceVariable("c0_public_mutable_instance_member_variable_0")
            @Assert(false)
        } catch (e: Exception) {
        }
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c1_public_mutable_instance_member_variable_0").toString(), "c1_public_mutable_instance_member_variable_0: String")
        @Expect((TypeInfo.of<C2>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c2_public_mutable_instance_member_variable_0").toString(), "c2_public_mutable_instance_member_variable_0: String")
        @Expect((TypeInfo.of<C3>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c3_public_mutable_instance_member_variable_0").toString(), "c3_public_mutable_instance_member_variable_0: String")
        @Expect((TypeInfo.of<C4>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c4_public_mutable_instance_member_variable_0").toString(), "c4_public_mutable_instance_member_variable_0: String")
        @Expect((TypeInfo.of<C5>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c5_public_mutable_instance_member_variable_0").toString(), "c5_public_mutable_instance_member_variable_0: String")
        @Expect((TypeInfo.of<C6>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c6_public_mutable_instance_member_variable_0").toString(), "c6_public_mutable_instance_member_variable_0: String")
        @Expect((TypeInfo.of<C8>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c8_public_mutable_instance_member_variable_0").toString(), "c8_public_mutable_instance_member_variable_0: String")
        @Expect((TypeInfo.of<C9>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c9_public_mutable_instance_member_variable_0").toString(), "c9_public_mutable_instance_member_variable_0: String")
    }
}
