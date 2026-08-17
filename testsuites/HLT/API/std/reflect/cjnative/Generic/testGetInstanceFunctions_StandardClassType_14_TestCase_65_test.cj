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
class testGetInstanceFunctions_StandardClassType_14 {
    @TestCase
    func TestCase_65(): Unit {
        // logger.info("testcase TestCase_65 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Float64, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_66").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, Float64, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
            .apply(StandardClassType<UInt16, Float64, UInt64>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#1981: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#1982: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1983: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1984: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1985: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1986: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1987: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1988: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1989: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1990: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1991: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#1992: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#1993: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#1994: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#1995: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1996: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1997: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1998: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1999: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#2000: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#2001: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#2002: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [])
            @Expect("assertion#2003: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2004: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [])
            @Expect("assertion#2005: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [])
            @Expect("assertion#2006: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2007: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [])
            @Expect("assertion#2008: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#2009: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#2010: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#2011: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [()])
            @Expect("assertion#2012: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2013: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2014: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_65 ends.")
    }
}
