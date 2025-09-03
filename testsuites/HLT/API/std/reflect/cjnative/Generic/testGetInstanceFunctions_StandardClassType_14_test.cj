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
class testGetInstanceFunctions_StandardClassType_14 {
    @TestCase
    func TestCase_65(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Float64, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_66").size)
        TypeInfo
            .of<StandardClassType<UInt16, Float64, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
            .apply(StandardClassType<UInt16, Float64, UInt64>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                [GenericClassWith1TypeParameters<Bool>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#1981: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#1982: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1983: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1984: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
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
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1986: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1987: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
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
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#1993: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#1994: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
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
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1996: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1997: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
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
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#2000: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#2001: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#2002: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [])
            @Expect("assertion#2003: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2004: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [])
            @Expect("assertion#2005: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [])
            @Expect("assertion#2006: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2007: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [])
            @Expect("assertion#2008: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
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
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#2010: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#2011: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(StandardClassType<UInt16, Float64, UInt64>(), [()])
            @Expect("assertion#2012: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2013: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_66")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2014: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_66(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt16, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_67").size)
        TypeInfo
            .of<StandardClassType<UInt32, UInt16, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
            .apply(StandardClassType<UInt32, UInt16, UInt16>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()],
                [GenericClassWith1TypeParameters<Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2017: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2018: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2019: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2020: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2021: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2022: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2023: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2024: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2025: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2026: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2027: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2028: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2029: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2030: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2031: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2032: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2033: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2034: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2035: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2036: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [])
            @Expect("assertion#2037: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2038: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [])
            @Expect("assertion#2039: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [])
            @Expect("assertion#2040: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2041: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [])
            @Expect("assertion#2042: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2043: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2044: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2045: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt16>(), [()])
            @Expect("assertion#2046: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2047: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_67")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2048: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_67(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Int8, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_68").size)
        TypeInfo
            .of<StandardClassType<Unit, Int8, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
            .apply(StandardClassType<Unit, Int8, UInt64>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                [GenericClassWith1TypeParameters<Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2049: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2050: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2051: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2052: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2053: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2054: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2055: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2056: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2057: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2058: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2059: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2060: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2061: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#2062: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2063: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2064: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2065: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2066: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2067: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2068: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2069: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2070: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [])
            @Expect("assertion#2071: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2072: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [])
            @Expect("assertion#2073: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [])
            @Expect("assertion#2074: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2075: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [])
            @Expect("assertion#2076: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2077: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2078: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2079: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [()])
            @Expect("assertion#2080: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2081: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2082: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_68(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt16, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_69").size)
        TypeInfo
            .of<StandardClassType<Int64, UInt16, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
            .apply(StandardClassType<Int64, UInt16, UInt16>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()],
                [GenericClassWith1TypeParameters<UInt16>()])
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#2083: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#2084: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2085: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2086: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2087: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2088: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2089: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2090: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#2091: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#2092: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#2093: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2094: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2095: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2096: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#2097: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2098: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2099: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#2100: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2101: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#2102: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#2103: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#2104: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [])
            @Expect("assertion#2105: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2106: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [])
            @Expect("assertion#2107: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [])
            @Expect("assertion#2108: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2109: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [])
            @Expect("assertion#2110: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(),
                    [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#2111: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#2112: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#2113: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [()])
            @Expect("assertion#2114: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2115: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2116: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_69(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Bool, Unit>>().getInstanceFunctions("classInstanceMemberFunction_70").size)
        TypeInfo
            .of<StandardClassType<Int16, Bool, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
            .apply(StandardClassType<Int16, Bool, Unit>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()],
                [GenericClassWith1TypeParameters<Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2118: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2119: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2120: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2121: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2122: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2123: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2124: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2125: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2126: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2127: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2128: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2129: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2130: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2131: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2132: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2133: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2134: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2135: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2136: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2137: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2138: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [])
            @Expect("assertion#2139: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2140: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [])
            @Expect("assertion#2141: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [])
            @Expect("assertion#2142: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2143: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [])
            @Expect("assertion#2144: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2145: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2146: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2147: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [()])
            @Expect("assertion#2148: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2149: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2150: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
