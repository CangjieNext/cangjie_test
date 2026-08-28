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
    func TestCase_50(): Unit {
        // logger.info("testcase TestCase_50 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, Int16, Int16>>().getInstanceFunctions("classInstanceMemberFunction_51").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, Int16, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
            .apply(StandardClassType<Int8, Int16, Int16>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [1i16])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [1i16])
            @Expect("assertion#1471: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [1i16])
            @Expect("assertion#1472: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#1473: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(StandardClassType<Int8, Int16, Int16>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#1474: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1475: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#1476: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(StandardClassType<Int8, Int16, Int16>(), [TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1477: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1478: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [1i16, 114.514000f64])
            @Expect("assertion#1479: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [1i16, 114.514000f64])
            @Expect("assertion#1480: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(StandardClassType<Int8, Int16, Int16>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [1i16, 114.514000f64])
            @Expect("assertion#1481: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(StandardClassType<Int8, Int16, Int16>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#1482: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#1483: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#1484: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(StandardClassType<Int8, Int16, Int16>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [1i16])
            @Expect("assertion#1485: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(StandardClassType<Int8, Int16, Int16>(), [TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1486: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(StandardClassType<Int8, Int16, Int16>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#1487: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(StandardClassType<Int8, Int16, Int16>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [1i16, 114.514000f64])
            @Expect("assertion#1488: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(StandardClassType<Int8, Int16, Int16>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#1489: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(StandardClassType<Int8, Int16, Int16>(), [1i16])
            @Expect("assertion#1490: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(1i64, [1i16])
            @Expect("assertion#1491: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply("hello", [1i16])
            @Expect("assertion#1492: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(StandardClassType<Int8, Int16, Int16>(), [])
            @Expect("assertion#1493: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1494: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply("hello", [])
            @Expect("assertion#1495: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(StandardClassType<Int8, Int16, Int16>(), [])
            @Expect("assertion#1496: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1497: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply("hello", [])
            @Expect("assertion#1498: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(StandardClassType<Int8, Int16, Int16>(), [1i16, 114.514000f64])
            @Expect("assertion#1499: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(1i64, [1i16, 114.514000f64])
            @Expect("assertion#1500: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply("hello", [1i16, 114.514000f64])
            @Expect("assertion#1501: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(StandardClassType<Int8, Int16, Int16>(), [114.514000f64])
            @Expect("assertion#1502: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#1503: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Int16, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_51")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#1504: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_50 ends.")
    }
}
