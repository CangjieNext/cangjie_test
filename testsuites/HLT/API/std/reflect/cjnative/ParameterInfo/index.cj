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

@Test
class Test {
    @TestCase
    func testClass(): Unit {
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Bool>(), TypeInfo.of<Rune>()).parameters[0].index, 0)
        @Expect((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Bool>(), TypeInfo.of<Rune>()).parameters[1].index, 1)
    }
    @TestCase
    func testStruct(): Unit {
        @Expect((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Int8>(), TypeInfo.of<Rune>()).parameters[0].index, 0)
        @Expect((TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Int8>(), TypeInfo.of<Rune>()).parameters[1].index, 1)
    }
}
