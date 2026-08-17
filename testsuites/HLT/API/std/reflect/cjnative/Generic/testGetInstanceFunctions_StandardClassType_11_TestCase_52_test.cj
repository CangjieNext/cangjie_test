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
    func TestCase_52(): Unit {
        // logger.info("testcase TestCase_52 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Bool, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_53").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Bool, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
            .apply(StandardClassType<Int32, Bool, UInt16>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [114.514000f32])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [114.514000f32])
            @Expect("assertion#1539: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [114.514000f32])
            @Expect("assertion#1540: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1541: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(StandardClassType<Int32, Bool, UInt16>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1542: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1543: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1544: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(StandardClassType<Int32, Bool, UInt16>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1545: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1546: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [114.514000f32, 114.514000f64])
            @Expect("assertion#1547: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [114.514000f32, 114.514000f64])
            @Expect("assertion#1548: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(StandardClassType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f32, 114.514000f64])
            @Expect("assertion#1549: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(StandardClassType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1550: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1551: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#1552: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(StandardClassType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f32])
            @Expect("assertion#1553: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(StandardClassType<Int32, Bool, UInt16>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1554: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(StandardClassType<Int32, Bool, UInt16>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1555: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(StandardClassType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [114.514000f32, 114.514000f64])
            @Expect("assertion#1556: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(StandardClassType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1557: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(StandardClassType<Int32, Bool, UInt16>(), [114.514000f32])
            @Expect("assertion#1558: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(1i64, [114.514000f32])
            @Expect("assertion#1559: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply("hello", [114.514000f32])
            @Expect("assertion#1560: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(StandardClassType<Int32, Bool, UInt16>(), [])
            @Expect("assertion#1561: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1562: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply("hello", [])
            @Expect("assertion#1563: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(StandardClassType<Int32, Bool, UInt16>(), [])
            @Expect("assertion#1564: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1565: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply("hello", [])
            @Expect("assertion#1566: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(StandardClassType<Int32, Bool, UInt16>(), [114.514000f32, 114.514000f64])
            @Expect("assertion#1567: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(1i64, [114.514000f32, 114.514000f64])
            @Expect("assertion#1568: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply("hello", [114.514000f32, 114.514000f64])
            @Expect("assertion#1569: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(StandardClassType<Int32, Bool, UInt16>(), [()])
            @Expect("assertion#1570: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1571: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_53")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1572: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_52 ends.")
    }
}
