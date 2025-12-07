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
import std.sort.SortExtension
import std.collection.*
import MyType.myType.*

@Test
class Test {
    var arr = Array<String>()
    @TestCase
    func testClass(): Unit {
        arr = (TypeInfo.of<C0>() as ClassTypeInfo).getOrThrow().instanceVariables |>
            map {a: InstanceVariableInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[]")
        arr = (TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().instanceVariables |>
            map {a: InstanceVariableInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[c1_public_mutable_instance_member_variable_0: String, c1_public_mutable_instance_member_variable_1: Int64, c1_public_primary_constructor_instance_member_variable_0: Int64, c1_public_primary_constructor_instance_member_variable_1: String, c1_public_primary_constructor_instance_member_variable_2: Int64, c1_public_primary_constructor_instance_member_variable_3: String, c1_public_readonly_instance_member_variable_0: Int64]")
        arr = (TypeInfo.of<C2>() as ClassTypeInfo).getOrThrow().instanceVariables |>
            map {a: InstanceVariableInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[c2_public_mutable_instance_member_variable_0: String, c2_public_readonly_instance_member_variable_0: Int64]")
        arr = (TypeInfo.of<C3>() as ClassTypeInfo).getOrThrow().instanceVariables |>
            map {a: InstanceVariableInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[c3_public_mutable_instance_member_variable_0: String, c3_public_readonly_instance_member_variable_0: Int64]")
        arr = (TypeInfo.of<C4>() as ClassTypeInfo).getOrThrow().instanceVariables |>
            map {a: InstanceVariableInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[c4_public_mutable_instance_member_variable_0: String, c4_public_readonly_instance_member_variable_0: Int64]")
        arr = (TypeInfo.of<C5>() as ClassTypeInfo).getOrThrow().instanceVariables |>
            map {a: InstanceVariableInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[c5_public_mutable_instance_member_variable_0: String, c5_public_readonly_instance_member_variable_0: Int64]")
        arr = (TypeInfo.of<C6>() as ClassTypeInfo).getOrThrow().instanceVariables |>
            map {a: InstanceVariableInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[c6_public_mutable_instance_member_variable_0: String, c6_public_readonly_instance_member_variable_0: Int64]")
        arr = (TypeInfo.of<C7<Rune, UInt32, Float16, Unit>>() as ClassTypeInfo).getOrThrow().instanceVariables |>
            map {a: InstanceVariableInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[c7_public_mutable_instance_member_variable_0: String, c7_public_readonly_instance_member_variable_0: Int64]")
        arr = (TypeInfo.of<C8>() as ClassTypeInfo).getOrThrow().instanceVariables |>
            map {a: InstanceVariableInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[c8_public_mutable_instance_member_variable_0: String, c8_public_readonly_instance_member_variable_0: Int64]")
        arr = (TypeInfo.of<C9>() as ClassTypeInfo).getOrThrow().instanceVariables |>
            map {a: InstanceVariableInfo => a.toString()} |> collectArray
        arr.sort();
        @Expect(arr.toString(), "[c9_public_mutable_instance_member_variable_0: String, c9_public_readonly_instance_member_variable_0: Int64]")
    }
}
