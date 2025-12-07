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
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceFunction("c1_public_instance_member_function_0", TypeInfo.of<Float32>(), TypeInfo.of<C1>(), TypeInfo.of<S1>(), TypeInfo.of<Float64>()).isAbstract(), false)
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getInstanceFunction("c1_public_open_instance_member_function_0").isAbstract(), false)
        @Expect((TypeInfo.of<C3>() as ClassTypeInfo).getOrThrow().getInstanceFunction("c3_public_abstract_instance_member_function_0").isAbstract(), true)
    }
    @TestCase
    func testStruct(): Unit {
        @Expect((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getInstanceFunction("s1_public_instance_member_function_0", TypeInfo.of<S1>(), TypeInfo.of<Rune>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()).isAbstract(), false)
    }
}
