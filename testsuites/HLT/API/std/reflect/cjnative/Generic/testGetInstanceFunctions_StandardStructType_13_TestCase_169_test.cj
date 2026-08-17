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
    func TestCase_169(): Unit {
        // logger.info("testcase TestCase_169 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Int32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_170").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, Int32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
            .apply(StandardStructType<Float32, Int32, Int8>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [NonGenericClass()])
            @Expect("assertion#5288: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
            @Expect("assertion#5289: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5290: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(StandardStructType<Float32, Int32, Int8>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5291: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5292: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5293: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(StandardStructType<Float32, Int32, Int8>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5294: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5295: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5296: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5297: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(StandardStructType<Float32, Int32, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5298: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(StandardStructType<Float32, Int32, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#5299: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#5300: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#5301: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(StandardStructType<Float32, Int32, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#5302: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(StandardStructType<Float32, Int32, Int8>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5303: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(StandardStructType<Float32, Int32, Int8>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5304: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(StandardStructType<Float32, Int32, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5305: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(StandardStructType<Float32, Int32, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5306: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(StandardStructType<Float32, Int32, Int8>(), [NonGenericClass()])
            @Expect("assertion#5307: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#5308: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#5309: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(StandardStructType<Float32, Int32, Int8>(), [])
            @Expect("assertion#5310: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5311: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply("hello", [])
            @Expect("assertion#5312: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(StandardStructType<Float32, Int32, Int8>(), [])
            @Expect("assertion#5313: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5314: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply("hello", [])
            @Expect("assertion#5315: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(StandardStructType<Float32, Int32, Int8>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5316: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5317: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5318: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(StandardStructType<Float32, Int32, Int8>(), [()])
            @Expect("assertion#5319: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5320: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_170")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5321: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_169 ends.")
    }
}
