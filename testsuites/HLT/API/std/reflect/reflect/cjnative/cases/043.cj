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
        let ti = (TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow()
        @Expect((ti.getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).apply(ti, [1u16, r'a', 1.2f16, C1()]) as UInt32).getOrThrow(), 12)

        @Expect((ti.getStaticFunction("c1_public_static_member_function_1", TypeInfo.of<String>(), TypeInfo.of<UInt32>(), TypeInfo.of<C1>()).apply(ti, ["123", 12u32, C1()]) as Float64).getOrThrow(), 12.9)

        // 实参数目不等。
        try {
            ti
                .getStaticFunction("c1_public_static_member_function_1", TypeInfo.of<String>(), TypeInfo.of<UInt32>(),
                    TypeInfo.of<C1>())
                .apply(ti, [12]);
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalArgumentException: The input parameter item does not comply with the required quantity.")
        }

        // 实参类型不匹配。
        try {
            ti
                .getStaticFunction("c1_public_static_member_function_1", TypeInfo.of<String>(), TypeInfo.of<UInt32>(),
                    TypeInfo.of<C1>())
                .apply(ti, [12, C1(), 12]);
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalTypeException: The input parameter does not match the type of the input parameter required by the function.")
        }

        // 静态成员函数内部抛出异常。
        try {
            ti.getStaticFunction("c1_public_static_member_function_2", TypeInfo.of<String>()).apply(ti, ["hello"]);
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "Exception: exception from instance member function")
        }
    }
    @TestCase
    func testStruct(): Unit {
        let ti = (TypeInfo.of<S1>() as StructTypeInfo).getOrThrow()
        @Expect((ti.getStaticFunction("s1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).apply(ti, [1u16, r'a', 1.2f16, C1()]) as UInt32).getOrThrow(), 12)
    }
}
