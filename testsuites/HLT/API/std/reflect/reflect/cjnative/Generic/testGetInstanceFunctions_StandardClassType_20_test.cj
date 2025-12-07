/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// (not MAC) EXEC: cd dependency && %compiler %cmp_opt --output-type=dylib  *.cj -o libdependency.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output --import-path . -L dependency -ldependency
// (not MAC) RUN-EXEC: %cp ./dependency/libdependency.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args  
package testsuite

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*

@Test
class testGetInstanceFunctions_StandardClassType_20 {
    @TestCase
    func TestCase_95(): Unit {
        // logger.info("testcase TestCase_95 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>().getInstanceFunctions("classInstanceMemberFunction_96").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, UInt8, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
            .apply(StandardClassType<Int64, UInt8, Float32>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                [GenericStructWith1TypeParameters<UInt8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#3001: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#3002: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3003: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3004: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#3005: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3006: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3007: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3008: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#3009: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#3010: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#3011: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3012: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3013: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#3014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#3015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#3016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#3017: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#3018: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3019: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#3020: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#3021: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#3022: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [])
            @Expect("assertion#3023: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3024: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [])
            @Expect("assertion#3025: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [])
            @Expect("assertion#3026: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3027: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [])
            @Expect("assertion#3028: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(),
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#3029: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#3030: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#3031: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(StandardClassType<Int64, UInt8, Float32>(), [()])
            @Expect("assertion#3032: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3033: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_96")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3034: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_95 ends.")
    }

    @TestCase
    func TestCase_96(): Unit {
        // logger.info("testcase TestCase_96 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, Int16, Unit>>().getInstanceFunctions("classInstanceMemberFunction_97").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, Int16, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
            .apply(StandardClassType<Float64, Int16, Unit>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                [GenericStructWith1TypeParameters<Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#3035: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#3036: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#3037: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(StandardClassType<Float64, Int16, Unit>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#3038: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3039: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#3040: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(StandardClassType<Float64, Int16, Unit>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#3041: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3042: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#3043: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#3044: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(StandardClassType<Float64, Int16, Unit>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#3045: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(StandardClassType<Float64, Int16, Unit>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#3046: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#3047: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#3048: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(StandardClassType<Float64, Int16, Unit>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#3049: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(StandardClassType<Float64, Int16, Unit>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#3050: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(StandardClassType<Float64, Int16, Unit>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#3051: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(StandardClassType<Float64, Int16, Unit>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#3052: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(StandardClassType<Float64, Int16, Unit>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3053: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(StandardClassType<Float64, Int16, Unit>(), [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#3054: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#3055: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#3056: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(StandardClassType<Float64, Int16, Unit>(), [])
            @Expect("assertion#3057: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3058: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply("hello", [])
            @Expect("assertion#3059: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(StandardClassType<Float64, Int16, Unit>(), [])
            @Expect("assertion#3060: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3061: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply("hello", [])
            @Expect("assertion#3062: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(StandardClassType<Float64, Int16, Unit>(),
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#3063: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#3064: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#3065: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(StandardClassType<Float64, Int16, Unit>(), [()])
            @Expect("assertion#3066: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3067: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_97")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3068: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_96 ends.")
    }

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

    @TestCase
    func TestCase_98(): Unit {
        // logger.info("testcase TestCase_98 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Bool, Unit>>().getInstanceFunctions("classInstanceMemberFunction_99").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, Bool, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
            .apply(StandardClassType<Unit, Bool, Unit>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()],
                [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3103: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3104: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#3105: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#3106: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#3107: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#3108: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3109: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#3110: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3111: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3112: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3113: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#3114: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#3115: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#3116: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#3118: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#3119: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3120: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#3121: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3122: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3123: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#3124: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [])
            @Expect("assertion#3125: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3126: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [])
            @Expect("assertion#3127: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [])
            @Expect("assertion#3128: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3129: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [])
            @Expect("assertion#3130: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3131: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3132: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3133: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(StandardClassType<Unit, Bool, Unit>(), [()])
            @Expect("assertion#3134: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3135: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_99")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3136: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_98 ends.")
    }

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
