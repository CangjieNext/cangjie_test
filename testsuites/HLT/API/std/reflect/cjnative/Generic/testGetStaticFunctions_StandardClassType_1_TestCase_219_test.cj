/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: dependency
// EXEC: %compiler %cmp_opt %compile_library dependency/*.cj -o libdependency.%library_suffix
// EXEC: %compiler %cmp_opt -L. -ldependency %f %cmp_utest_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args  
package testsuite

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*

@Test
class testGetStaticFunctions_StandardClassType_1 {
    @TestCase
    func TestCase_219(): Unit {
        // logger.info("testcase TestCase_219 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Float32, UInt64>>().getStaticFunctions("classStaticMemberFunction_2").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Float32, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_2")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Float32, UInt64>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6961: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float32, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()],
                    [114.514000f64])
            @Expect("assertion#6962: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float32, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float32, UInt64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#6963: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float32, UInt64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6964: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float32, UInt64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6965: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#6966: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float32, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#6967: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float32, UInt64> got.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float32, UInt64>>(), [])
            @Expect("assertion#6968: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#6969: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float32, UInt64>>(), [114.514000f64])
            @Expect("assertion#6970: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#6971: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_219 ends.")
    }
}
