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
    func TestCase_99(): Unit {
        // logger.info("testcase TestCase_99 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_100").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, UInt64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
            .apply(StandardClassType<UInt32, UInt64, Float32>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3137: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3138: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3139: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(StandardClassType<UInt32, UInt64, Float32>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3140: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3141: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3142: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(StandardClassType<UInt32, UInt64, Float32>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#3143: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3144: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3145: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3146: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(StandardClassType<UInt32, UInt64, Float32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3147: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(StandardClassType<UInt32, UInt64, Float32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#3148: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#3149: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#3150: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(StandardClassType<UInt32, UInt64, Float32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3151: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(StandardClassType<UInt32, UInt64, Float32>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#3152: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(StandardClassType<UInt32, UInt64, Float32>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3153: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(StandardClassType<UInt32, UInt64, Float32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3154: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(StandardClassType<UInt32, UInt64, Float32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3155: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(StandardClassType<UInt32, UInt64, Float32>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3156: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3157: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3158: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(StandardClassType<UInt32, UInt64, Float32>(), [])
            @Expect("assertion#3159: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3160: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply("hello", [])
            @Expect("assertion#3161: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(StandardClassType<UInt32, UInt64, Float32>(), [])
            @Expect("assertion#3162: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3163: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply("hello", [])
            @Expect("assertion#3164: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(StandardClassType<UInt32, UInt64, Float32>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3165: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3166: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3167: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(StandardClassType<UInt32, UInt64, Float32>(), [()])
            @Expect("assertion#3168: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3169: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_100")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3170: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_99 ends.")
    }
}
