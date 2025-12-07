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
