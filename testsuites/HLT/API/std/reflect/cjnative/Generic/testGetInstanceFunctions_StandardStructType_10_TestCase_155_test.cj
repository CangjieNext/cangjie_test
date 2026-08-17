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
class testGetInstanceFunctions_StandardStructType_10 {
    @TestCase
    func TestCase_155(): Unit {
        // logger.info("testcase TestCase_155 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Float32, Int16>>().getInstanceFunctions("classInstanceMemberFunction_156").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Float32, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
            .apply(StandardStructType<UInt32, Float32, Int16>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [123i64])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [123i64])
            @Expect("assertion#4812: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [123i64])
            @Expect("assertion#4813: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#4814: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#4815: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#4816: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#4817: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#4818: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#4819: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [123i64, 114.514000f64])
            @Expect("assertion#4820: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [123i64, 114.514000f64])
            @Expect("assertion#4821: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#4822: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#4823: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#4824: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [114.514000f64])
            @Expect("assertion#4825: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#4826: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#4827: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#4828: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [123i64, 114.514000f64])
            @Expect("assertion#4829: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#4830: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [123i64])
            @Expect("assertion#4831: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#4832: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#4833: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [])
            @Expect("assertion#4834: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4835: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [])
            @Expect("assertion#4836: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [])
            @Expect("assertion#4837: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4838: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [])
            @Expect("assertion#4839: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [123i64, 114.514000f64])
            @Expect("assertion#4840: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#4841: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#4842: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [114.514000f64])
            @Expect("assertion#4843: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#4844: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#4845: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_155 ends.")
    }
}
