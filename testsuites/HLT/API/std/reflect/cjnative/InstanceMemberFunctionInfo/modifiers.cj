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
import std.sort.SortExtension

@Test
class Test {
    var arr = Array<String>()
    @TestCase
    func testClass(): Unit {
        arr = (TypeInfo
            .of<C1>() as ClassTypeInfo)
            .getOrThrow()
            .getInstanceFunction("c1_public_instance_member_function_0", TypeInfo.of<Float32>(), TypeInfo.of<C1>(),
                TypeInfo.of<S1>(), TypeInfo.of<Float64>())
            .modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
    }
    @TestCase
    func testStruct(): Unit {
        arr = (TypeInfo
            .of<S1>() as StructTypeInfo)
            .getOrThrow()
            .getInstanceFunction("s1_public_instance_member_function_0", TypeInfo.of<S1>(), TypeInfo.of<Rune>(),
                TypeInfo.of<UInt32>(), TypeInfo.of<Float32>())
            .modifiers |> map {a: ModifierInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
    }
}
