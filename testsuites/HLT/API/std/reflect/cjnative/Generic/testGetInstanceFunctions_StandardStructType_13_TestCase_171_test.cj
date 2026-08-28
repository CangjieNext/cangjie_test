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
    func TestCase_171(): Unit {
        // logger.info("testcase TestCase_171 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, UInt64, Int8>>().getInstanceFunctions("classInstanceMemberFunction_172").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, UInt64, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
            .apply(StandardStructType<Int32, UInt64, Int8>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
            @Expect("assertion#5356: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#5357: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5358: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int8>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5359: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5360: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5361: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int8>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5362: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5363: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5364: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5365: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5366: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#5367: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#5368: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#5369: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#5370: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int8>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5371: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int8>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5372: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5373: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5374: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int8>(), [NonGenericClass()])
            @Expect("assertion#5375: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#5376: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#5377: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int8>(), [])
            @Expect("assertion#5378: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5379: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply("hello", [])
            @Expect("assertion#5380: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int8>(), [])
            @Expect("assertion#5381: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5382: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply("hello", [])
            @Expect("assertion#5383: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int8>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5384: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5385: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5386: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int8>(), [()])
            @Expect("assertion#5387: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5388: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_172")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5389: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_171 ends.")
    }
}
