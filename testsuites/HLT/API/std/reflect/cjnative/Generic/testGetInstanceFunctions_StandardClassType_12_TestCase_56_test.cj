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
class testGetInstanceFunctions_StandardClassType_12 {
    @TestCase
    func TestCase_56(): Unit {
        // logger.info("testcase TestCase_56 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Int8, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_57").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Int8, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
            .apply(StandardClassType<Float32, Int8, UInt32>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [NonGenericClass()])
            @Expect("assertion#1675: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#1676: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1677: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1678: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1679: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1680: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#1681: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1682: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1683: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1684: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1685: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#1686: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#1687: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1688: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#1689: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#1690: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1691: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1692: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1693: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [NonGenericClass()])
            @Expect("assertion#1694: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#1695: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#1696: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [])
            @Expect("assertion#1697: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1698: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [])
            @Expect("assertion#1699: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [])
            @Expect("assertion#1700: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1701: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [])
            @Expect("assertion#1702: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1703: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1704: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1705: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [()])
            @Expect("assertion#1706: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1707: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1708: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_56 ends.")
    }
}
