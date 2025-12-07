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
// (not Windows and not MAC) RUN-EXEC: %cp ./MyType/libMyType_myType.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args
// (Windows) chcp 65001 > nul && %cp ./MyType/libMyType_myType.%test_suffix .&& %run %run_opt %output %run_args 1>result.txt && dos2unix result.txt && cat result.txt
import std.reflect.*
import MyType.myType.*
import std.collection.*

@Test
class Test {
    var arr = Array<String>()
    @TestCase
    func testClass(): Unit {
        @Expect(((TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor().apply() as C1).getOrThrow().c1_public_mutable_instance_member_variable_0, "kiki")
        // 实参数目与形参不等。
        try {
            (TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor().apply(12);
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalArgumentException: The input parameter item does not comply with the required quantity.")
        }
        // 实参类型匹配失败。
        try {
            (TypeInfo
                .of<C1>() as ClassTypeInfo)
                .getOrThrow()
                .getConstructor(TypeInfo.of<Bool>(), TypeInfo.of<Rune>())
                .apply(true, 12);
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "IllegalTypeException: The input parameter does not match the type of the input parameter required by the function.")
        }
        // 试图构建抽象类。
        try {
            (TypeInfo.of<C3>() as ClassTypeInfo).getOrThrow().getConstructor().apply();
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "InvocationTargetException: Abstract constructor cannot apply.")
        }
        // 构造器内部抛出异常。
        try {
            (TypeInfo.of<C1>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Int64>()).apply(12);
            @Assert(false)
        } catch (e: Exception) {
            @Expect(e.toString(), "Exception: init exception.")
        }
    }
    @TestCase
    func testStruct(): Unit {
    }
}
