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
    func TestCase_48(): Unit {
        // logger.info("testcase TestCase_48 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, Bool, Float64>>().getInstanceFunctions("classInstanceMemberFunction_49").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, Bool, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
            .apply(StandardClassType<Float64, Bool, Float64>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1403: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#1404: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#1405: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#1406: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1407: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#1408: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#1409: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1410: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#1411: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [(), 114.514000f64])
            @Expect("assertion#1412: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [(), 114.514000f64])
            @Expect("assertion#1413: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#1414: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#1415: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [123i64])
            @Expect("assertion#1416: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1417: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#1418: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#1419: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#1420: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#1421: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [()])
            @Expect("assertion#1422: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1423: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1424: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [])
            @Expect("assertion#1425: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1426: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [])
            @Expect("assertion#1427: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [])
            @Expect("assertion#1428: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1429: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [])
            @Expect("assertion#1430: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [(), 114.514000f64])
            @Expect("assertion#1431: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [(), 114.514000f64])
            @Expect("assertion#1432: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [(), 114.514000f64])
            @Expect("assertion#1433: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [123i64])
            @Expect("assertion#1434: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#1435: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#1436: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_48 ends.")
    }
}
