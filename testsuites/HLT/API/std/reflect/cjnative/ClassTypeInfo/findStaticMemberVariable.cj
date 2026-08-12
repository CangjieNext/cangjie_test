/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (host_win) EXEC: if not exist %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix %compiler %cmp_opt %compile_library --module-name=MyType ./MyType/src/myType/*.cj -o %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix
// (!host_win) EXEC: [ ! -f %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix ] && %compiler %cmp_opt %compile_library --module-name=MyType ./MyType/src/myType/*.cj -o %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix || true
// EXEC: %compiler %cmp_opt -o %output %f -L %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType --import-path %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType -lMyType.myType %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
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
