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
class testGetInstanceFunctions_StandardClassType_19 {
    @TestCase
    func TestCase_90(): Unit {
        // logger.info("testcase TestCase_90 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Float32, Int32>>().getInstanceFunctions("classInstanceMemberFunction_91").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, Float32, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
            .apply(StandardClassType<Unit, Float32, Int32>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
            @Expect("assertion#2831: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#2832: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2833: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2834: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2835: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2836: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2837: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2838: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2839: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2840: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2841: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#2842: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#2843: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2844: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#2845: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2846: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2847: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2848: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2849: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [NonGenericStruct()])
            @Expect("assertion#2850: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2851: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2852: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [])
            @Expect("assertion#2853: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2854: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [])
            @Expect("assertion#2855: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [])
            @Expect("assertion#2856: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2857: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [])
            @Expect("assertion#2858: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2859: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2860: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2861: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(StandardClassType<Unit, Float32, Int32>(), [()])
            @Expect("assertion#2862: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2863: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Float32, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_91")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2864: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_90 ends.")
    }

    @TestCase
    func TestCase_91(): Unit {
        // logger.info("testcase TestCase_91 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int8, Unit>>().getInstanceFunctions("classInstanceMemberFunction_92").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Int8, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
            .apply(StandardClassType<Int16, Int8, Unit>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#2865: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#2866: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2867: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2868: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2869: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2870: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2871: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2872: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#2873: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#2874: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#2875: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#2876: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#2877: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#2878: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#2879: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2880: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2881: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#2882: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2883: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#2884: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#2885: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#2886: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [])
            @Expect("assertion#2887: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2888: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply("hello", [])
            @Expect("assertion#2889: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [])
            @Expect("assertion#2890: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2891: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply("hello", [])
            @Expect("assertion#2892: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#2893: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#2894: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#2895: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [()])
            @Expect("assertion#2896: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2897: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_92")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2898: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_91 ends.")
    }

    @TestCase
    func TestCase_92(): Unit {
        // logger.info("testcase TestCase_92 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, UInt32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_93").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, UInt32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
            .apply(StandardClassType<Int8, UInt32, Int8>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                [GenericStructWith1TypeParameters<Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#2899: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#2900: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#2901: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#2902: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2903: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#2904: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2905: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2906: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#2907: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#2908: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#2909: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#2910: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#2911: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#2912: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#2913: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#2915: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#2916: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2917: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#2918: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#2919: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#2920: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [])
            @Expect("assertion#2921: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2922: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply("hello", [])
            @Expect("assertion#2923: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [])
            @Expect("assertion#2924: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2925: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply("hello", [])
            @Expect("assertion#2926: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#2927: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#2928: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#2929: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [()])
            @Expect("assertion#2930: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2931: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_93")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2932: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_92 ends.")
    }

    @TestCase
    func TestCase_93(): Unit {
        // logger.info("testcase TestCase_93 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, UInt32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_94").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, UInt32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
            .apply(StandardClassType<Int8, UInt32, Int8>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()],
                [GenericStructWith1TypeParameters<Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#2933: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#2934: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2935: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2936: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2937: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2938: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2939: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2940: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2941: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2942: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2943: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#2944: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#2945: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2946: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#2947: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2948: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2949: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2950: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2951: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#2952: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#2953: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#2954: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [])
            @Expect("assertion#2955: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2956: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [])
            @Expect("assertion#2957: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [])
            @Expect("assertion#2958: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2959: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [])
            @Expect("assertion#2960: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2961: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2962: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2963: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(StandardClassType<Int8, UInt32, Int8>(), [()])
            @Expect("assertion#2964: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2965: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_94")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2966: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_93 ends.")
    }

    @TestCase
    func TestCase_94(): Unit {
        // logger.info("testcase TestCase_94 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, Bool, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_95").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, Bool, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
            .apply(StandardClassType<Float64, Bool, UInt64>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                [GenericStructWith1TypeParameters<Float64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#2967: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#2968: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2969: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2970: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2971: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2972: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#2973: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2974: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#2975: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#2976: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#2977: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#2978: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#2979: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#2980: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#2981: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#2982: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#2983: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#2984: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2985: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#2986: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#2987: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#2988: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [])
            @Expect("assertion#2989: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2990: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply("hello", [])
            @Expect("assertion#2991: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [])
            @Expect("assertion#2992: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2993: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply("hello", [])
            @Expect("assertion#2994: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(),
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#2995: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#2996: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#2997: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(StandardClassType<Float64, Bool, UInt64>(), [()])
            @Expect("assertion#2998: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2999: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_95")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3000: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_94 ends.")
    }
}
