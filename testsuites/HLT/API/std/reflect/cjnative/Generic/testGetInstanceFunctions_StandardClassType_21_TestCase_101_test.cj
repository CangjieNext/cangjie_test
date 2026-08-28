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
    func TestCase_101(): Unit {
        // logger.info("testcase TestCase_101 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Int64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_102").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Int64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
            .apply(StandardClassType<UInt8, Int64, Float32>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()],
                [GenericStructWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#3205: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#3206: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3207: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3208: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3209: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3210: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3211: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3212: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#3213: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#3214: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#3215: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#3216: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#3217: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#3218: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#3219: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#3220: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3221: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#3222: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3223: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#3224: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#3225: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#3226: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [])
            @Expect("assertion#3227: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3228: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [])
            @Expect("assertion#3229: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [])
            @Expect("assertion#3230: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3231: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [])
            @Expect("assertion#3232: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#3233: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#3234: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#3235: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(StandardClassType<UInt8, Int64, Float32>(), [()])
            @Expect("assertion#3236: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3237: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_102")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3238: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_101 ends.")
    }
}
