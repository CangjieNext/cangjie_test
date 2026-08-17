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
    func TestCase_105(): Unit {
        // logger.info("testcase TestCase_105 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Float32, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_106").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, Float32, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
            .apply(StandardClassType<Bool, Float32, UInt16>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                [GenericStructWith2TypeParameters<UInt16, UInt16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#3341: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#3342: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3343: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3344: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#3345: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3346: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#3347: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3348: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#3349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#3350: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#3351: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#3352: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#3353: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#3354: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#3355: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#3356: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3357: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#3358: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3359: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#3360: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#3361: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#3362: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [])
            @Expect("assertion#3363: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3364: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [])
            @Expect("assertion#3365: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [])
            @Expect("assertion#3366: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3367: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [])
            @Expect("assertion#3368: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(),
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#3369: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#3370: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#3371: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(StandardClassType<Bool, Float32, UInt16>(), [()])
            @Expect("assertion#3372: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3373: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_106")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3374: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_105 ends.")
    }
}
