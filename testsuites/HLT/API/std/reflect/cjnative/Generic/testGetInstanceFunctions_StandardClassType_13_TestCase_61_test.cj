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
class testGetInstanceFunctions_StandardClassType_13 {
    @TestCase
    func TestCase_61(): Unit {
        // logger.info("testcase TestCase_61 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, UInt16, Int8>>().getInstanceFunctions("classInstanceMemberFunction_62").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, UInt16, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
            .apply(StandardClassType<Int16, UInt16, Int8>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [NonGenericClass()])
            @Expect("assertion#1845: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [NonGenericClass()])
            @Expect("assertion#1846: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1847: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(StandardClassType<Int16, UInt16, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1848: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1849: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1850: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(StandardClassType<Int16, UInt16, Int8>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1851: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1852: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1853: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1854: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(StandardClassType<Int16, UInt16, Int8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1855: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(StandardClassType<Int16, UInt16, Int8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#1856: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#1857: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#1858: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(StandardClassType<Int16, UInt16, Int8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#1859: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(StandardClassType<Int16, UInt16, Int8>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1860: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(StandardClassType<Int16, UInt16, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1861: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(StandardClassType<Int16, UInt16, Int8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1862: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(StandardClassType<Int16, UInt16, Int8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1863: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(StandardClassType<Int16, UInt16, Int8>(), [NonGenericClass()])
            @Expect("assertion#1864: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#1865: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#1866: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(StandardClassType<Int16, UInt16, Int8>(), [])
            @Expect("assertion#1867: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1868: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply("hello", [])
            @Expect("assertion#1869: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(StandardClassType<Int16, UInt16, Int8>(), [])
            @Expect("assertion#1870: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1871: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply("hello", [])
            @Expect("assertion#1872: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(StandardClassType<Int16, UInt16, Int8>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1873: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1874: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1875: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(StandardClassType<Int16, UInt16, Int8>(), [()])
            @Expect("assertion#1876: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1877: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_62")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1878: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_61 ends.")
    }
}
