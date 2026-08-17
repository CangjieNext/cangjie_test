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
class testGetInstanceFunctions_StandardClassType_22 {
    @TestCase
    func TestCase_106(): Unit {
        // logger.info("testcase TestCase_106 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Bool, Float64>>().getInstanceFunctions("classInstanceMemberFunction_107").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Bool, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
            .apply(StandardClassType<Int16, Bool, Float64>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3375: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3376: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#3377: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#3378: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3379: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#3380: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3381: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3382: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3383: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3384: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3385: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#3386: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#3387: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#3388: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3389: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3390: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#3391: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3392: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3393: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3394: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3395: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#3396: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [])
            @Expect("assertion#3397: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3398: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [])
            @Expect("assertion#3399: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [])
            @Expect("assertion#3400: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3401: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [])
            @Expect("assertion#3402: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3403: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3404: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#3405: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(StandardClassType<Int16, Bool, Float64>(), [()])
            @Expect("assertion#3406: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3407: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_107")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3408: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_106 ends.")
    }
}
