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
class testGetInstanceFunctions_StandardClassType_1 {
    @TestCase
    func TestCase_1(): Unit {
        // logger.info("testcase TestCase_1 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Int8, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_2").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, Int8, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
            .apply(StandardClassType<UInt16, Int8, UInt64>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#12: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [114.514000f64])
            @Expect("assertion#13: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<UInt16, Int8, UInt64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()],
                    [114.514000f64])
            @Expect("assertion#14: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#15: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<UInt16, Int8, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<UInt16, Int8, UInt64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()],
                    [114.514000f64])
            @Expect("assertion#17: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#18: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt16, Int8, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#19: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#20: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#21: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<UInt16, Int8, UInt64>(), [])
            @Expect("assertion#22: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [])
            @Expect("assertion#23: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [])
            @Expect("assertion#24: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(StandardClassType<UInt16, Int8, UInt64>(), [114.514000f64])
            @Expect("assertion#25: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#26: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_2")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#27: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_1 ends.")
    }
}
