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
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
            @Expect("assertion#2798: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2799: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2800: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
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
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2802: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2803: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
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
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2805: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2806: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
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
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
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
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#2809: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2810: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
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
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2812: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2813: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
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
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
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
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [NonGenericStruct()])
            @Expect("assertion#2816: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2817: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2818: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [])
            @Expect("assertion#2819: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2820: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [])
            @Expect("assertion#2821: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [])
            @Expect("assertion#2822: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2823: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [])
            @Expect("assertion#2824: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2825: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2826: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2827: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(StandardClassType<Float64, Float64, Bool>(), [()])
            @Expect("assertion#2828: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2829: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_90")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2830: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_90' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_89 ends.")
    }
}
