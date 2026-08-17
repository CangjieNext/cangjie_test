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
}
