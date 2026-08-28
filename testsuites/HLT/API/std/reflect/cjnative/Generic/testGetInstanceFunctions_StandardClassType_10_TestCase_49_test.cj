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
    func TestCase_49(): Unit {
        // logger.info("testcase TestCase_49 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int8, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_50").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Int8, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
            .apply(StandardClassType<UInt64, Int8, UInt64>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [123u64])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [123u64])
            @Expect("assertion#1437: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [123u64])
            @Expect("assertion#1438: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1439: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1440: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1441: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1442: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#1443: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1444: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [123u64, 114.514000f64])
            @Expect("assertion#1445: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [123u64, 114.514000f64])
            @Expect("assertion#1446: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [123u64, 114.514000f64])
            @Expect("assertion#1447: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#1448: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#1449: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#1450: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [123u64])
            @Expect("assertion#1451: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#1452: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1453: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [123u64, 114.514000f64])
            @Expect("assertion#1454: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#1455: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [123u64])
            @Expect("assertion#1456: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [123u64])
            @Expect("assertion#1457: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [123u64])
            @Expect("assertion#1458: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [])
            @Expect("assertion#1459: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1460: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [])
            @Expect("assertion#1461: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [])
            @Expect("assertion#1462: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1463: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [])
            @Expect("assertion#1464: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [123u64, 114.514000f64])
            @Expect("assertion#1465: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [123u64, 114.514000f64])
            @Expect("assertion#1466: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [123u64, 114.514000f64])
            @Expect("assertion#1467: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [114.514000f64])
            @Expect("assertion#1468: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#1469: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#1470: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_49 ends.")
    }
}
