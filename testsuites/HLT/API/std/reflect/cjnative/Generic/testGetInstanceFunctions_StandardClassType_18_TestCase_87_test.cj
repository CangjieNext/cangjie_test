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
}
