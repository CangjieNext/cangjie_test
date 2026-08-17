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
class testGetInstanceFunctions_StandardClassType_16 {
    @TestCase
    func TestCase_77(): Unit {
        // logger.info("testcase TestCase_77 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Bool, Int32>>().getInstanceFunctions("classInstanceMemberFunction_78").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Bool, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
            .apply(StandardClassType<Float32, Bool, Int32>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2389: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2390: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2391: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2392: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2393: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2394: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#2395: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2396: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2397: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2398: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2399: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2400: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2401: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#2402: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2403: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#2404: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2405: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2406: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2407: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2408: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2409: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2410: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [])
            @Expect("assertion#2411: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2412: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [])
            @Expect("assertion#2413: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [])
            @Expect("assertion#2414: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2415: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [])
            @Expect("assertion#2416: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2417: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2418: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2419: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [()])
            @Expect("assertion#2420: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2421: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2422: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_77 ends.")
    }
}
