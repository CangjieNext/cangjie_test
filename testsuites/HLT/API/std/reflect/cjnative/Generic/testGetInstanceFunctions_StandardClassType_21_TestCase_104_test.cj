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
    func TestCase_104(): Unit {
        // logger.info("testcase TestCase_104 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Int16, Int64>>().getInstanceFunctions("classInstanceMemberFunction_105").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Int16, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
            .apply(StandardClassType<UInt8, Int16, Int64>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                [GenericStructWith2TypeParameters<Int16, Int16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#3307: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#3308: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3309: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3310: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#3311: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3312: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3313: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3314: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#3315: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#3316: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#3317: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#3318: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#3319: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#3320: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#3321: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3322: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3323: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#3324: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3325: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#3326: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#3327: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#3328: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [])
            @Expect("assertion#3329: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3330: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [])
            @Expect("assertion#3331: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [])
            @Expect("assertion#3332: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3333: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [])
            @Expect("assertion#3334: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(),
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#3335: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#3336: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#3337: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(StandardClassType<UInt8, Int16, Int64>(), [()])
            @Expect("assertion#3338: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3339: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int16, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_105")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3340: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_104 ends.")
    }
}
