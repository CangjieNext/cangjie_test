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
class testGetInstanceFunctions_StandardClassType_21 {
    @TestCase
    func TestCase_100(): Unit {
        // logger.info("testcase TestCase_100 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Int32, Int64>>().getInstanceFunctions("classInstanceMemberFunction_101").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, Int32, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
            .apply(StandardClassType<UInt32, Int32, Int64>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>()],
                [GenericStructWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#3171: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#3172: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3173: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3174: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3175: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3176: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#3177: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3178: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#3179: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#3180: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#3181: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3182: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3183: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#3184: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#3185: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#3186: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3187: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#3188: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3189: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#3190: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#3191: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#3192: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [])
            @Expect("assertion#3193: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3194: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [])
            @Expect("assertion#3195: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [])
            @Expect("assertion#3196: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3197: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [])
            @Expect("assertion#3198: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#3199: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#3200: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#3201: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(StandardClassType<UInt32, Int32, Int64>(), [()])
            @Expect("assertion#3202: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3203: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_101")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3204: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_100 ends.")
    }
}
