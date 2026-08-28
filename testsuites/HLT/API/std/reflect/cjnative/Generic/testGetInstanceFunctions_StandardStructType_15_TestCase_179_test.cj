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
class testGetInstanceFunctions_StandardStructType_15 {
    @TestCase
    func TestCase_179(): Unit {
        // logger.info("testcase TestCase_179 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Float64, Int16>>().getInstanceFunctions("classInstanceMemberFunction_180").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, Float64, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
            .apply(StandardStructType<Float32, Float64, Int16>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                [GenericClassWith1TypeParameters<Float64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5628: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5629: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5630: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5631: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5632: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5633: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5634: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5635: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5636: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5637: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5638: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#5639: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#5640: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#5641: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5642: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5643: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5644: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5645: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5646: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5647: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5648: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5649: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [])
            @Expect("assertion#5650: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5651: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [])
            @Expect("assertion#5652: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [])
            @Expect("assertion#5653: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5654: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [])
            @Expect("assertion#5655: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(),
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5656: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5657: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5658: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [()])
            @Expect("assertion#5659: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5660: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5661: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_179 ends.")
    }
}
