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
    func TestCase_107(): Unit {
        // logger.info("testcase TestCase_107 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, UInt64, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_108").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, UInt64, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
            .apply(StandardClassType<Bool, UInt64, UInt64>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()],
                [GenericStructWith2TypeParameters<Float32, Float32>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#3409: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#3410: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3411: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3412: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#3413: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3414: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3415: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3416: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#3417: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#3418: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#3419: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#3420: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#3421: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3422: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#3423: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3424: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3425: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#3426: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3427: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#3428: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#3429: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#3430: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [])
            @Expect("assertion#3431: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3432: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [])
            @Expect("assertion#3433: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [])
            @Expect("assertion#3434: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3435: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [])
            @Expect("assertion#3436: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(),
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#3437: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#3438: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#3439: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(StandardClassType<Bool, UInt64, UInt64>(), [()])
            @Expect("assertion#3440: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3441: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_108")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3442: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_107 ends.")
    }
}
