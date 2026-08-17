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
    func TestCase_68(): Unit {
        // logger.info("testcase TestCase_68 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt16, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_69").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, UInt16, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
            .apply(StandardClassType<Int64, UInt16, UInt16>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()],
                [GenericClassWith1TypeParameters<UInt16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#2083: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2085: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2086: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2088: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2089: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型检查失败")
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
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2095: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2096: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2098: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2099: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#2102: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#2103: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#2104: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [])
            @Expect("assertion#2105: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2106: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [])
            @Expect("assertion#2107: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [])
            @Expect("assertion#2108: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2109: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [])
            @Expect("assertion#2110: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#2112: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#2113: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(StandardClassType<Int64, UInt16, UInt16>(), [()])
            @Expect("assertion#2114: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2115: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_69")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2116: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_68 ends.")
    }
}
