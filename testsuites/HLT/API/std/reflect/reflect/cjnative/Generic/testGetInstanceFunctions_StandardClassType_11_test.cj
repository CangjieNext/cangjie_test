/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// (not MAC) EXEC: cd dependency && %compiler %cmp_opt --output-type=dylib  *.cj -o libdependency.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output --import-path . -L dependency -ldependency
// (not MAC) RUN-EXEC: %cp ./dependency/libdependency.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args  
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

    @TestCase
    func TestCase_51(): Unit {
        // logger.info("testcase TestCase_51 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, UInt64, Bool>>().getInstanceFunctions("classInstanceMemberFunction_52").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, UInt64, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
            .apply(StandardClassType<Float32, UInt64, Bool>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [true])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [true])
            @Expect("assertion#1505: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [true])
            @Expect("assertion#1506: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1507: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1508: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1509: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1510: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1511: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1512: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [true, 114.514000f64])
            @Expect("assertion#1513: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [true, 114.514000f64])
            @Expect("assertion#1514: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [true, 114.514000f64])
            @Expect("assertion#1515: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#1516: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#1517: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#1518: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [true])
            @Expect("assertion#1519: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1520: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1521: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [true, 114.514000f64])
            @Expect("assertion#1522: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1523: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [true])
            @Expect("assertion#1524: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(1i64, [true])
            @Expect("assertion#1525: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply("hello", [true])
            @Expect("assertion#1526: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [])
            @Expect("assertion#1527: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1528: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply("hello", [])
            @Expect("assertion#1529: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [])
            @Expect("assertion#1530: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1531: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply("hello", [])
            @Expect("assertion#1532: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [true, 114.514000f64])
            @Expect("assertion#1533: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(1i64, [true, 114.514000f64])
            @Expect("assertion#1534: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply("hello", [true, 114.514000f64])
            @Expect("assertion#1535: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(StandardClassType<Float32, UInt64, Bool>(), [()])
            @Expect("assertion#1536: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1537: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_52")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1538: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_51 ends.")
    }

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

    @TestCase
    func TestCase_54(): Unit {
        // logger.info("testcase TestCase_54 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, Bool, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_55").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, Bool, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
            .apply(StandardClassType<Float64, Bool, UInt64>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [1i8])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [1i8])
            @Expect("assertion#1607: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [1i8])
            @Expect("assertion#1608: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#1609: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#1610: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1611: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#1612: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#1613: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1614: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [1i8, 114.514000f64])
            @Expect("assertion#1615: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [1i8, 114.514000f64])
            @Expect("assertion#1616: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [1i8, 114.514000f64])
            @Expect("assertion#1617: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#1618: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#1619: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#1620: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [1i8])
            @Expect("assertion#1621: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#1622: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#1623: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [1i8, 114.514000f64])
            @Expect("assertion#1624: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#1625: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [1i8])
            @Expect("assertion#1626: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(1i64, [1i8])
            @Expect("assertion#1627: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply("hello", [1i8])
            @Expect("assertion#1628: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [])
            @Expect("assertion#1629: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1630: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply("hello", [])
            @Expect("assertion#1631: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [])
            @Expect("assertion#1632: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1633: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply("hello", [])
            @Expect("assertion#1634: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [1i8, 114.514000f64])
            @Expect("assertion#1635: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(1i64, [1i8, 114.514000f64])
            @Expect("assertion#1636: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply("hello", [1i8, 114.514000f64])
            @Expect("assertion#1637: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [114.514000f64])
            @Expect("assertion#1638: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#1639: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_55")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#1640: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_54 ends.")
    }
}
