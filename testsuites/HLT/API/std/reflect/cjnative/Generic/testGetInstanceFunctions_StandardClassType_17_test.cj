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
class testGetInstanceFunctions_StandardClassType_17 {
    @TestCase
    func TestCase_80(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt16, Int32>>().getInstanceFunctions("classInstanceMemberFunction_81").size)
        TypeInfo
            .of<StandardClassType<Int64, UInt16, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
            .apply(StandardClassType<Int64, UInt16, Int32>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                [GenericClassWith2TypeParameters<UInt8, UInt8>()])
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2491: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2492: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2493: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(StandardClassType<Int64, UInt16, Int32>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2494: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2495: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2496: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(StandardClassType<Int64, UInt16, Int32>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2497: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2498: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2499: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2500: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(StandardClassType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2501: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(StandardClassType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#2502: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#2503: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2504: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(StandardClassType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2505: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(StandardClassType<Int64, UInt16, Int32>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2506: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(StandardClassType<Int64, UInt16, Int32>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2507: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(StandardClassType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2508: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(StandardClassType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2509: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(StandardClassType<Int64, UInt16, Int32>(), [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2510: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2511: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2512: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(StandardClassType<Int64, UInt16, Int32>(), [])
            @Expect("assertion#2513: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2514: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply("hello", [])
            @Expect("assertion#2515: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(StandardClassType<Int64, UInt16, Int32>(), [])
            @Expect("assertion#2516: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2517: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply("hello", [])
            @Expect("assertion#2518: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(StandardClassType<Int64, UInt16, Int32>(),
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2519: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2520: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2521: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(StandardClassType<Int64, UInt16, Int32>(), [()])
            @Expect("assertion#2522: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2523: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_81")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2524: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_81(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int32, Int32>>().getInstanceFunctions("classInstanceMemberFunction_82").size)
        TypeInfo
            .of<StandardClassType<UInt64, Int32, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
            .apply(StandardClassType<UInt64, Int32, Int32>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()],
                [GenericClassWith2TypeParameters<Int8, Int8>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#2525: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#2526: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2527: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int32>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2528: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2529: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2530: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int32>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2531: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2532: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#2533: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#2534: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#2535: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#2536: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#2537: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#2538: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#2539: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int32>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2540: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int32>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2541: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#2542: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2543: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int32>(), [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#2544: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#2545: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#2546: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int32>(), [])
            @Expect("assertion#2547: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2548: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply("hello", [])
            @Expect("assertion#2549: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int32>(), [])
            @Expect("assertion#2550: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2551: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply("hello", [])
            @Expect("assertion#2552: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int32>(),
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#2553: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#2554: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#2555: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(StandardClassType<UInt64, Int32, Int32>(), [()])
            @Expect("assertion#2556: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2557: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_82")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2558: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_82(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int8, Unit>>().getInstanceFunctions("classInstanceMemberFunction_83").size)
        TypeInfo
            .of<StandardClassType<Int16, Int8, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
            .apply(StandardClassType<Int16, Int8, Unit>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
            @Expect("assertion#2559: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#2560: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2561: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2562: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2563: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2564: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2565: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2566: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2567: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2568: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2569: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2570: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2571: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2572: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#2573: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2574: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2575: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2576: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2577: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [NonGenericStruct()])
            @Expect("assertion#2578: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2579: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2580: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [])
            @Expect("assertion#2581: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2582: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [])
            @Expect("assertion#2583: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [])
            @Expect("assertion#2584: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2585: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [])
            @Expect("assertion#2586: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2587: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2588: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2589: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [()])
            @Expect("assertion#2590: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2591: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2592: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_83(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Float64, Unit>>().getInstanceFunctions("classInstanceMemberFunction_84").size)
        TypeInfo
            .of<StandardClassType<UInt16, Float64, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
            .apply(StandardClassType<UInt16, Float64, Unit>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#2593: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#2594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2595: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2596: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2597: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2598: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2599: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2600: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2601: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2602: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2603: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2604: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2605: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#2606: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#2607: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2608: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2610: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2611: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [NonGenericStruct()])
            @Expect("assertion#2612: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2613: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2614: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [])
            @Expect("assertion#2615: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2616: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [])
            @Expect("assertion#2617: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [])
            @Expect("assertion#2618: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2619: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [])
            @Expect("assertion#2620: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2621: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2622: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2623: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [()])
            @Expect("assertion#2624: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2625: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2626: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_84(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, UInt32, Int16>>().getInstanceFunctions("classInstanceMemberFunction_85").size)
        TypeInfo
            .of<StandardClassType<Int32, UInt32, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
            .apply(StandardClassType<Int32, UInt32, Int16>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
            @Expect("assertion#2627: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#2628: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2629: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2630: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2631: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2632: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2633: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2634: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2635: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2636: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2637: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#2638: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#2639: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#2640: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#2641: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2642: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2643: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2644: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2645: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [NonGenericStruct()])
            @Expect("assertion#2646: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2647: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2648: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [])
            @Expect("assertion#2649: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2650: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [])
            @Expect("assertion#2651: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [])
            @Expect("assertion#2652: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2653: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [])
            @Expect("assertion#2654: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2655: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2656: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2657: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [()])
            @Expect("assertion#2658: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2659: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2660: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
