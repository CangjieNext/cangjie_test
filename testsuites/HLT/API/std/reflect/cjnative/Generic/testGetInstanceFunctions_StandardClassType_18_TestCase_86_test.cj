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
class testGetInstanceFunctions_StandardClassType_18 {
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
}
