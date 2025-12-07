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
// (not MAC) RUN-EXEC: %cp ./MyType/libMyType_myType.%test_suffix .&& %run %run_opt %output %run_args
import std.reflect.*
import MyType.myType.*

@Test
class Test {
    @TestCase
    func testPrimitive(): Unit {
        // 所有原始数据类型都是Any的子类型。
        try {
            TypeInfo.of<Int8>().getInstanceFunction("xxx")
            @Assert(false)
        } catch (e: Exception) {
        }
    }
    @TestCase
    func testInterface(): Unit {
        // 不存在的实例成员函数。
        try {
            TypeInfo.of<I0>().getInstanceFunction("xxx")
            @Assert(false)
        } catch (e: Exception) {
        }
        // 成功获取公开开放实例成员函数。
        @Expect(TypeInfo.of<I1>().getInstanceFunction("i1_public_open_instance_member_function_0").toString(), "open abstract func i1_public_open_instance_member_function_0(): Unit")
        // 成功获取公开抽象实例成员函数。
        @Expect(TypeInfo.of<I1>().getInstanceFunction("i1_public_abstract_instance_member_function_0").toString(), "open abstract func i1_public_abstract_instance_member_function_0(): Unit")
    }
    @TestCase
    func testClass(): Unit {
        // 非抽象实例成员函数。
        @Expect(TypeInfo.of<C1>().getInstanceFunction("c1_public_instance_member_function_0", TypeInfo.of<Float32>(), TypeInfo.of<C1>(), TypeInfo.of<S1>(), TypeInfo.of<Float64>()).toString(), "func c1_public_instance_member_function_0(Float32, MyType.myType.C1, MyType.myType.S1, Float64): Int16")
        // 抽象实例成员函数。
        @Expect(TypeInfo.of<C3>().getInstanceFunction("c3_public_abstract_instance_member_function_0").toString(), "open abstract func c3_public_abstract_instance_member_function_0(): Int16")
        // 无法获取到非public实例成员函数。
        // @Expect(TypeInfo.of<C1>().getInstanceFunction(""))
    }
    @TestCase
    func testStruct(): Unit {
        @Expect(TypeInfo.of<S1>().getInstanceFunction("s1_public_instance_member_function_0", TypeInfo.of<S1>(), TypeInfo.of<Rune>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()).toString(), "func s1_public_instance_member_function_0(MyType.myType.S1, Rune, UInt32, Float32): Int16")
    }
}
