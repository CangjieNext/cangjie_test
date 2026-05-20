/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt %compile_library --module-name=MyType ./MyType/src/myType/*.cj -o libMyType.myType.%library_suffix
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt -o %output %f -L. -lMyType.myType %cmp_utest_opt
// (!(target_mac | target_ios | target_ios_simulator)) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
import std.reflect.*
import MyType.myType.*
import std.collection.*

@Test
class Test {
    @TestCase
    func testClass(): Unit {
        let c1 = C1()
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c1_public_mutable_instance_member_variable_1").getValue(c1) as Int64).getOrThrow(), 12)
        (TypeInfo
            .of<C1>() as ClassTypeInfo)
            .getOrThrow()
            .getInstanceVariable("c1_public_mutable_instance_member_variable_1")
            .setValue(c1, 13)
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c1_public_mutable_instance_member_variable_1").getValue(c1) as Int64).getOrThrow(), 13)

        // @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceVariable("c1_public_readonly_instance_member_variable_0").getValue(C1()) as Int64).getOrThrow(), 12)
    }
    @TestCase
    func testStruct(): Unit {
        // @Expect(((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getInstanceVariable("s1_public_mutable_instance_member_variable_0").getValue(S1()) as Rune).getOrThrow(), r'a')
        // @Expect(((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getInstanceVariable("s1_public_readonly_instance_member_variable_0").getValue(S1()) as Int8).getOrThrow(), 12)
    }
}
