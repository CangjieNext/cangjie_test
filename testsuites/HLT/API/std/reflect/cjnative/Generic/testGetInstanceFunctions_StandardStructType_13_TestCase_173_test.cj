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
class testGetInstanceFunctions_StandardStructType_13 {
    @TestCase
    func TestCase_173(): Unit {
        // logger.info("testcase TestCase_173 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, UInt8, Float32>>().getInstanceFunctions("classInstanceMemberFunction_174").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, UInt8, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
            .apply(StandardStructType<UInt32, UInt8, Float32>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()],
                [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#5424: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#5425: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5426: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(StandardStructType<UInt32, UInt8, Float32>(), [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5427: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5428: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5429: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(StandardStructType<UInt32, UInt8, Float32>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5430: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5431: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#5432: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#5433: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(StandardStructType<UInt32, UInt8, Float32>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#5434: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(StandardStructType<UInt32, UInt8, Float32>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5435: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5436: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#5437: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(StandardStructType<UInt32, UInt8, Float32>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#5438: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(StandardStructType<UInt32, UInt8, Float32>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5439: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(StandardStructType<UInt32, UInt8, Float32>(), [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5440: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(StandardStructType<UInt32, UInt8, Float32>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#5441: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(StandardStructType<UInt32, UInt8, Float32>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5442: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(StandardStructType<UInt32, UInt8, Float32>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#5443: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#5444: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#5445: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(StandardStructType<UInt32, UInt8, Float32>(), [])
            @Expect("assertion#5446: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5447: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply("hello", [])
            @Expect("assertion#5448: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(StandardStructType<UInt32, UInt8, Float32>(), [])
            @Expect("assertion#5449: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5450: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply("hello", [])
            @Expect("assertion#5451: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(StandardStructType<UInt32, UInt8, Float32>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#5452: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#5453: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#5454: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(StandardStructType<UInt32, UInt8, Float32>(), [()])
            @Expect("assertion#5455: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5456: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_174")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5457: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_173 ends.")
    }
}
