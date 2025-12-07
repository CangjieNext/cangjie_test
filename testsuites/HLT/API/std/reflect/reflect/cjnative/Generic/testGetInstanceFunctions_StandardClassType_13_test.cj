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
class testGetInstanceFunctions_StandardClassType_13 {
    @TestCase
    func TestCase_60(): Unit {
        // logger.info("testcase TestCase_60 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Int8, Float64>>().getInstanceFunctions("classInstanceMemberFunction_61").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, Int8, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
            .apply(StandardClassType<Unit, Int8, Float64>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [NonGenericClass()])
            @Expect("assertion#1811: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericClass()])
            @Expect("assertion#1812: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1813: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(StandardClassType<Unit, Int8, Float64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1814: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1815: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1816: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(StandardClassType<Unit, Int8, Float64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1817: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1818: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1819: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1820: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(StandardClassType<Unit, Int8, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1821: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(StandardClassType<Unit, Int8, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#1822: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#1823: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#1824: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(StandardClassType<Unit, Int8, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#1825: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(StandardClassType<Unit, Int8, Float64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1826: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(StandardClassType<Unit, Int8, Float64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1827: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(StandardClassType<Unit, Int8, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1828: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(StandardClassType<Unit, Int8, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1829: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(StandardClassType<Unit, Int8, Float64>(), [NonGenericClass()])
            @Expect("assertion#1830: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#1831: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#1832: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(StandardClassType<Unit, Int8, Float64>(), [])
            @Expect("assertion#1833: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1834: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply("hello", [])
            @Expect("assertion#1835: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(StandardClassType<Unit, Int8, Float64>(), [])
            @Expect("assertion#1836: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1837: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply("hello", [])
            @Expect("assertion#1838: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(StandardClassType<Unit, Int8, Float64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1839: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1840: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1841: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(StandardClassType<Unit, Int8, Float64>(), [()])
            @Expect("assertion#1842: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1843: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_61")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1844: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_60 ends.")
    }

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

    @TestCase
    func TestCase_62(): Unit {
        // logger.info("testcase TestCase_62 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Int64, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_63").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, Int64, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
            .apply(StandardClassType<Unit, Int64, UInt32>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [NonGenericClass()])
            @Expect("assertion#1879: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#1880: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1881: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(StandardClassType<Unit, Int64, UInt32>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1882: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1883: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1884: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(StandardClassType<Unit, Int64, UInt32>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1885: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1886: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1887: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1888: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(StandardClassType<Unit, Int64, UInt32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1889: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(StandardClassType<Unit, Int64, UInt32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#1890: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#1891: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#1892: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(StandardClassType<Unit, Int64, UInt32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#1893: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(StandardClassType<Unit, Int64, UInt32>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1894: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(StandardClassType<Unit, Int64, UInt32>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1895: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(StandardClassType<Unit, Int64, UInt32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1896: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(StandardClassType<Unit, Int64, UInt32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1897: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(StandardClassType<Unit, Int64, UInt32>(), [NonGenericClass()])
            @Expect("assertion#1898: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#1899: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#1900: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(StandardClassType<Unit, Int64, UInt32>(), [])
            @Expect("assertion#1901: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1902: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply("hello", [])
            @Expect("assertion#1903: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(StandardClassType<Unit, Int64, UInt32>(), [])
            @Expect("assertion#1904: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1905: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply("hello", [])
            @Expect("assertion#1906: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(StandardClassType<Unit, Int64, UInt32>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1907: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1908: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1909: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(StandardClassType<Unit, Int64, UInt32>(), [()])
            @Expect("assertion#1910: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1911: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_63")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1912: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_62 ends.")
    }

    @TestCase
    func TestCase_63(): Unit {
        // logger.info("testcase TestCase_63 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Int8, Float32>>().getInstanceFunctions("classInstanceMemberFunction_64").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Int8, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
            .apply(StandardClassType<Float32, Int8, Float32>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
            @Expect("assertion#1913: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [NonGenericClass()])
            @Expect("assertion#1914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#1915: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#1916: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1917: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#1918: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#1919: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1920: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1921: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1922: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1923: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#1924: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#1925: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#1926: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#1927: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#1928: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#1929: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1930: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1931: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [NonGenericClass()])
            @Expect("assertion#1932: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#1933: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#1934: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [])
            @Expect("assertion#1935: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1936: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [])
            @Expect("assertion#1937: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [])
            @Expect("assertion#1938: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1939: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [])
            @Expect("assertion#1940: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1941: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1942: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1943: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [()])
            @Expect("assertion#1944: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1945: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1946: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_63 ends.")
    }

    @TestCase
    func TestCase_64(): Unit {
        // logger.info("testcase TestCase_64 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Int16, Unit>>().getInstanceFunctions("classInstanceMemberFunction_65").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, Int16, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
            .apply(StandardClassType<Bool, Int16, Unit>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#1947: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#1948: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1949: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1950: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1951: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1952: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1953: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1954: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1955: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1956: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1957: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#1958: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#1959: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#1960: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#1961: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1962: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1963: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1964: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1965: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#1966: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#1967: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#1968: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [])
            @Expect("assertion#1969: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1970: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [])
            @Expect("assertion#1971: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [])
            @Expect("assertion#1972: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1973: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [])
            @Expect("assertion#1974: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1975: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1976: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1977: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [()])
            @Expect("assertion#1978: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1979: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1980: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_64 ends.")
    }
}
