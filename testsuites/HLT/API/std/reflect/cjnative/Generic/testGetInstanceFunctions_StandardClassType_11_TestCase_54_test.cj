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
