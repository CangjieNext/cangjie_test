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
    func TestCase_84(): Unit {
        // logger.info("testcase TestCase_84 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, UInt32, Int16>>().getInstanceFunctions("classInstanceMemberFunction_85").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, UInt32, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
            .apply(StandardClassType<Int32, UInt32, Int16>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
            @Expect("assertion#2627: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#2628: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2629: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2630: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2632: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2633: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2635: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2636: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型检查失败")
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
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#2639: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#2640: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2642: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2643: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [NonGenericStruct()])
            @Expect("assertion#2646: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2647: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2648: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [])
            @Expect("assertion#2649: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2650: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [])
            @Expect("assertion#2651: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [])
            @Expect("assertion#2652: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2653: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [])
            @Expect("assertion#2654: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2655: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2656: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2657: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(StandardClassType<Int32, UInt32, Int16>(), [()])
            @Expect("assertion#2658: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2659: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_85")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2660: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_84 ends.")
    }
}
