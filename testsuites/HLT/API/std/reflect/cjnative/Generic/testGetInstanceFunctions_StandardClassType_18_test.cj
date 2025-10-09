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
class testGetInstanceFunctions_StandardClassType_18 {
    @TestCase
    func TestCase_85(): Unit {
        // logger.info("testcase TestCase_85 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Float64, Int64>>().getInstanceFunctions("classInstanceMemberFunction_86").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Float64, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
            .apply(StandardClassType<UInt8, Float64, Int64>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#2661: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
            @Expect("assertion#2662: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2663: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(StandardClassType<UInt8, Float64, Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2664: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2665: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2666: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(StandardClassType<UInt8, Float64, Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2667: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2668: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2669: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2670: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(StandardClassType<UInt8, Float64, Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2671: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(StandardClassType<UInt8, Float64, Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#2672: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#2673: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2674: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(StandardClassType<UInt8, Float64, Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#2675: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(StandardClassType<UInt8, Float64, Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2676: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(StandardClassType<UInt8, Float64, Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2677: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(StandardClassType<UInt8, Float64, Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2678: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(StandardClassType<UInt8, Float64, Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2679: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(StandardClassType<UInt8, Float64, Int64>(), [NonGenericStruct()])
            @Expect("assertion#2680: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2681: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2682: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(StandardClassType<UInt8, Float64, Int64>(), [])
            @Expect("assertion#2683: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2684: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply("hello", [])
            @Expect("assertion#2685: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(StandardClassType<UInt8, Float64, Int64>(), [])
            @Expect("assertion#2686: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2687: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply("hello", [])
            @Expect("assertion#2688: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(StandardClassType<UInt8, Float64, Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2689: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2690: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2691: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(StandardClassType<UInt8, Float64, Int64>(), [()])
            @Expect("assertion#2692: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2693: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_86")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2694: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_85 ends.")
    }

    @TestCase
    func TestCase_86(): Unit {
        // logger.info("testcase TestCase_86 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Bool, Int32>>().getInstanceFunctions("classInstanceMemberFunction_87").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, Bool, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
            .apply(StandardClassType<UInt16, Bool, Int32>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#2695: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [NonGenericStruct()])
            @Expect("assertion#2696: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2697: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(StandardClassType<UInt16, Bool, Int32>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2698: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2699: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2700: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(StandardClassType<UInt16, Bool, Int32>(), [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2701: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(1i64,
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2702: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2703: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2704: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(StandardClassType<UInt16, Bool, Int32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2705: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(StandardClassType<UInt16, Bool, Int32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#2706: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#2707: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2708: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(StandardClassType<UInt16, Bool, Int32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#2709: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(StandardClassType<UInt16, Bool, Int32>(), [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2710: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(StandardClassType<UInt16, Bool, Int32>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2711: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(StandardClassType<UInt16, Bool, Int32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2712: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(StandardClassType<UInt16, Bool, Int32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#2713: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(StandardClassType<UInt16, Bool, Int32>(), [NonGenericStruct()])
            @Expect("assertion#2714: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2715: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2716: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(StandardClassType<UInt16, Bool, Int32>(), [])
            @Expect("assertion#2717: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2718: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply("hello", [])
            @Expect("assertion#2719: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(StandardClassType<UInt16, Bool, Int32>(), [])
            @Expect("assertion#2720: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2721: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply("hello", [])
            @Expect("assertion#2722: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(StandardClassType<UInt16, Bool, Int32>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2723: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2724: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2725: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(StandardClassType<UInt16, Bool, Int32>(), [()])
            @Expect("assertion#2726: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2727: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_87")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2728: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_86 ends.")
    }

    @TestCase
    func TestCase_87(): Unit {
        // logger.info("testcase TestCase_87 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, UInt32, Int16>>().getInstanceFunctions("classInstanceMemberFunction_88").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, UInt32, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
            .apply(StandardClassType<UInt16, UInt32, Int16>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [NonGenericStruct()])
            @Expect("assertion#2729: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#2730: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2731: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(StandardClassType<UInt16, UInt32, Int16>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2732: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2733: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2734: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(StandardClassType<UInt16, UInt32, Int16>(), [TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2735: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2736: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2737: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2738: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(StandardClassType<UInt16, UInt32, Int16>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2739: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(StandardClassType<UInt16, UInt32, Int16>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2740: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2741: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#2742: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(StandardClassType<UInt16, UInt32, Int16>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#2743: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(StandardClassType<UInt16, UInt32, Int16>(), [TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2744: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(StandardClassType<UInt16, UInt32, Int16>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2745: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(StandardClassType<UInt16, UInt32, Int16>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2746: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(StandardClassType<UInt16, UInt32, Int16>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2747: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(StandardClassType<UInt16, UInt32, Int16>(), [NonGenericStruct()])
            @Expect("assertion#2748: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2749: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2750: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(StandardClassType<UInt16, UInt32, Int16>(), [])
            @Expect("assertion#2751: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2752: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply("hello", [])
            @Expect("assertion#2753: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(StandardClassType<UInt16, UInt32, Int16>(), [])
            @Expect("assertion#2754: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2755: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply("hello", [])
            @Expect("assertion#2756: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(StandardClassType<UInt16, UInt32, Int16>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2757: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2758: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2759: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(StandardClassType<UInt16, UInt32, Int16>(), [()])
            @Expect("assertion#2760: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2761: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_88")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2762: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_87 ends.")
    }

    @TestCase
    func TestCase_88(): Unit {
        // logger.info("testcase TestCase_88 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, Unit, Int64>>().getInstanceFunctions("classInstanceMemberFunction_89").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, Unit, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
            .apply(StandardClassType<Int8, Unit, Int64>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [NonGenericStruct()])
            @Expect("assertion#2763: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
            @Expect("assertion#2764: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2765: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2766: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2767: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2768: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2769: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2770: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2771: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2772: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2773: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2774: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2775: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#2776: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#2777: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2778: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2779: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2780: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2781: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [NonGenericStruct()])
            @Expect("assertion#2782: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2783: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2784: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [])
            @Expect("assertion#2785: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2786: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [])
            @Expect("assertion#2787: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [])
            @Expect("assertion#2788: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2789: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [])
            @Expect("assertion#2790: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2791: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2792: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2793: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(StandardClassType<Int8, Unit, Int64>(), [()])
            @Expect("assertion#2794: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2795: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_89")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2796: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_88 ends.")
    }

    @TestCase
    func TestCase_89(): Unit {
        // logger.info("testcase TestCase_89 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, Float64, Bool>>().getInstanceFunctions("classInstanceMemberFunction_90").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, Float64, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
            .apply(StandardClassType<Float64, Float64, Bool>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#2797: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
            @Expect("assertion#2798: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2799: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2800: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2801: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2802: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2803: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2804: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2805: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2806: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2807: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#2808: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#2809: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2810: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#2811: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2812: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2813: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2814: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2815: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [NonGenericStruct()])
            @Expect("assertion#2816: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2817: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2818: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [])
            @Expect("assertion#2819: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2820: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [])
            @Expect("assertion#2821: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [])
            @Expect("assertion#2822: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2823: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [])
            @Expect("assertion#2824: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2825: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2826: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2827: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [()])
            @Expect("assertion#2828: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2829: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2830: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_89 ends.")
    }
}
