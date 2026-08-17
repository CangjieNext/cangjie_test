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
class testGetInstanceFunctions_StandardClassType_17 {
    @TestCase
    func TestCase_83(): Unit {
        // logger.info("testcase TestCase_83 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Float64, Unit>>().getInstanceFunctions("classInstanceMemberFunction_84").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, Float64, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
            .apply(StandardClassType<UInt16, Float64, Unit>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#2593: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#2594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2595: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2596: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2598: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2599: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2601: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2602: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型检查失败")
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
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2605: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#2606: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2608: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [NonGenericStruct()])
            @Expect("assertion#2612: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2613: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2614: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [])
            @Expect("assertion#2615: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2616: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [])
            @Expect("assertion#2617: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [])
            @Expect("assertion#2618: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2619: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [])
            @Expect("assertion#2620: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2621: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2622: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2623: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(StandardClassType<UInt16, Float64, Unit>(), [()])
            @Expect("assertion#2624: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2625: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_84")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2626: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_83 ends.")
    }
}
