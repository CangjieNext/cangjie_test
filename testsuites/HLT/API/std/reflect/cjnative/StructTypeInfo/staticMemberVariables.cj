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
import std.sort.SortExtension
import std.collection.*

@Test
class Test {
    var arr = Array<String>()

    @TestCase
    func testClass(): Unit {
        arr = (TypeInfo.of<S0>() as StructTypeInfo).getOrThrow().staticVariables |>
            map {a: StaticVariableInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = (TypeInfo.of<S1>() as StructTypeInfo).getOrThrow().staticVariables |>
            map {a: StaticVariableInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static s1_public_mutable_static_member_variable_0: Rune, static s1_public_mutable_static_member_variable_1: String, static s1_public_readonly_static_member_variable_0: Int8, static s1_public_readonly_static_member_variable_1: String]")
        arr = (TypeInfo.of<S2>() as StructTypeInfo).getOrThrow().staticVariables |>
            map {a: StaticVariableInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static s2_public_mutable_static_member_variable_0: Rune, static s2_public_readonly_static_member_variable_0: Int8]")
        arr = (TypeInfo.of<S3>() as StructTypeInfo).getOrThrow().staticVariables |>
            map {a: StaticVariableInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[static s3_public_mutable_static_member_variable_0: Rune, static s3_public_readonly_static_member_variable_0: Int8]")
    }
}
