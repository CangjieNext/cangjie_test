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
class testGetInstanceFunctions_StandardClassType_20 {
    @TestCase
    func TestCase_97(): Unit {
        // logger.info("testcase TestCase_97 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Float64, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_98").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Float64, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
            .apply(StandardClassType<Float32, Float64, UInt8>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()],
                [GenericStructWith1TypeParameters<Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#3069: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#3070: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3071: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(StandardClassType<Float32, Float64, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3072: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3073: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3074: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(StandardClassType<Float32, Float64, UInt8>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#3075: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3076: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3077: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3078: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(StandardClassType<Float32, Float64, UInt8>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3079: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(StandardClassType<Float32, Float64, UInt8>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#3080: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#3081: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#3082: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(StandardClassType<Float32, Float64, UInt8>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#3083: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(StandardClassType<Float32, Float64, UInt8>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#3084: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(StandardClassType<Float32, Float64, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3085: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(StandardClassType<Float32, Float64, UInt8>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3086: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(StandardClassType<Float32, Float64, UInt8>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3087: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(StandardClassType<Float32, Float64, UInt8>(), [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#3088: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#3089: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#3090: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(StandardClassType<Float32, Float64, UInt8>(), [])
            @Expect("assertion#3091: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3092: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply("hello", [])
            @Expect("assertion#3093: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(StandardClassType<Float32, Float64, UInt8>(), [])
            @Expect("assertion#3094: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3095: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply("hello", [])
            @Expect("assertion#3096: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(StandardClassType<Float32, Float64, UInt8>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3097: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3098: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3099: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(StandardClassType<Float32, Float64, UInt8>(), [()])
            @Expect("assertion#3100: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3101: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_98")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3102: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_97 ends.")
    }
}
