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
class testGetInstanceFunctions_StandardClassType_11 {
    @TestCase
    func TestCase_53(): Unit {
        // logger.info("testcase TestCase_53 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Int16, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_54").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, Int16, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
            .apply(StandardClassType<UInt32, Int16, UInt32>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [1i32])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [1i32])
            @Expect("assertion#1573: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [1i32])
            @Expect("assertion#1574: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#1575: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(StandardClassType<UInt32, Int16, UInt32>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#1576: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1577: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#1578: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(StandardClassType<UInt32, Int16, UInt32>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1579: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1580: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [1i32, 114.514000f64])
            @Expect("assertion#1581: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [1i32, 114.514000f64])
            @Expect("assertion#1582: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(StandardClassType<UInt32, Int16, UInt32>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [1i32, 114.514000f64])
            @Expect("assertion#1583: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(StandardClassType<UInt32, Int16, UInt32>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#1584: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#1585: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [114.514000f64])
            @Expect("assertion#1586: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(StandardClassType<UInt32, Int16, UInt32>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [1i32])
            @Expect("assertion#1587: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(StandardClassType<UInt32, Int16, UInt32>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1588: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(StandardClassType<UInt32, Int16, UInt32>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#1589: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(StandardClassType<UInt32, Int16, UInt32>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [1i32, 114.514000f64])
            @Expect("assertion#1590: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(StandardClassType<UInt32, Int16, UInt32>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#1591: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(StandardClassType<UInt32, Int16, UInt32>(), [1i32])
            @Expect("assertion#1592: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(1i64, [1i32])
            @Expect("assertion#1593: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply("hello", [1i32])
            @Expect("assertion#1594: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(StandardClassType<UInt32, Int16, UInt32>(), [])
            @Expect("assertion#1595: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1596: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply("hello", [])
            @Expect("assertion#1597: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(StandardClassType<UInt32, Int16, UInt32>(), [])
            @Expect("assertion#1598: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1599: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply("hello", [])
            @Expect("assertion#1600: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(StandardClassType<UInt32, Int16, UInt32>(), [1i32, 114.514000f64])
            @Expect("assertion#1601: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(1i64, [1i32, 114.514000f64])
            @Expect("assertion#1602: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply("hello", [1i32, 114.514000f64])
            @Expect("assertion#1603: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(StandardClassType<UInt32, Int16, UInt32>(), [114.514000f64])
            @Expect("assertion#1604: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#1605: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_54")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#1606: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_53 ends.")
    }
}
