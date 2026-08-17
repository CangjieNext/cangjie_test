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
class testGetInstanceFunctions_StandardClassType_15 {
    @TestCase
    func TestCase_73(): Unit {
        // logger.info("testcase TestCase_73 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Int64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_74").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Int64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
            .apply(StandardClassType<Int32, Int64, Float32>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2253: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2254: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2255: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2256: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2257: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2258: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2259: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2260: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2261: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2262: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2263: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#2264: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#2265: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#2266: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2267: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2268: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2269: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2270: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2271: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2272: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2273: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2274: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [])
            @Expect("assertion#2275: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2276: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [])
            @Expect("assertion#2277: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [])
            @Expect("assertion#2278: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2279: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [])
            @Expect("assertion#2280: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2281: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2282: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2283: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [()])
            @Expect("assertion#2284: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2285: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2286: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_73 ends.")
    }
}
