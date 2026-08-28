/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
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
class testGetInstanceFunctions_StandardClassType_10 {
    @TestCase
    func TestCase_47(): Unit {
        // logger.info("testcase TestCase_47 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Float64, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_48").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Float64, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
            .apply(StandardClassType<UInt64, Float64, UInt32>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [true])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [true])
            @Expect("assertion#1369: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [true])
            @Expect("assertion#1370: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1371: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1372: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello",
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1373: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1374: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1375: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1376: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [true, 114.514000f64])
            @Expect("assertion#1377: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [true, 114.514000f64])
            @Expect("assertion#1378: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [true, 114.514000f64])
            @Expect("assertion#1379: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1380: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1381: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#1382: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [true])
            @Expect("assertion#1383: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1384: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1385: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [true, 114.514000f64])
            @Expect("assertion#1386: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1387: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [true])
            @Expect("assertion#1388: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [true])
            @Expect("assertion#1389: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [true])
            @Expect("assertion#1390: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [])
            @Expect("assertion#1391: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1392: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [])
            @Expect("assertion#1393: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [])
            @Expect("assertion#1394: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1395: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [])
            @Expect("assertion#1396: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [true, 114.514000f64])
            @Expect("assertion#1397: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [true, 114.514000f64])
            @Expect("assertion#1398: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [true, 114.514000f64])
            @Expect("assertion#1399: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [()])
            @Expect("assertion#1400: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1401: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1402: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_47 ends.")
    }
}
