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

    @TestCase
    func TestCase_170(): Unit {
        // logger.info("testcase TestCase_170 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Unit, Unit>>().getInstanceFunctions("classInstanceMemberFunction_171").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Unit, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
            .apply(StandardStructType<UInt32, Unit, Unit>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [NonGenericClass()])
            @Expect("assertion#5322: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#5323: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5324: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(StandardStructType<UInt32, Unit, Unit>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5325: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5326: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5327: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(StandardStructType<UInt32, Unit, Unit>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5328: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5329: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5330: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5331: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(StandardStructType<UInt32, Unit, Unit>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5332: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(StandardStructType<UInt32, Unit, Unit>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#5333: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#5334: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#5335: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(StandardStructType<UInt32, Unit, Unit>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#5336: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(StandardStructType<UInt32, Unit, Unit>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5337: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(StandardStructType<UInt32, Unit, Unit>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5338: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(StandardStructType<UInt32, Unit, Unit>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5339: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(StandardStructType<UInt32, Unit, Unit>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5340: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(StandardStructType<UInt32, Unit, Unit>(), [NonGenericClass()])
            @Expect("assertion#5341: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#5342: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#5343: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(StandardStructType<UInt32, Unit, Unit>(), [])
            @Expect("assertion#5344: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5345: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply("hello", [])
            @Expect("assertion#5346: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(StandardStructType<UInt32, Unit, Unit>(), [])
            @Expect("assertion#5347: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5348: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply("hello", [])
            @Expect("assertion#5349: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(StandardStructType<UInt32, Unit, Unit>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5350: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5351: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5352: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(StandardStructType<UInt32, Unit, Unit>(), [()])
            @Expect("assertion#5353: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5354: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Unit, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_171")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5355: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_170 ends.")
    }

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

    @TestCase
    func TestCase_172(): Unit {
        // logger.info("testcase TestCase_172 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Int64, Int16>>().getInstanceFunctions("classInstanceMemberFunction_173").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Int64, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
            .apply(StandardStructType<UInt8, Int64, Int16>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [NonGenericClass()])
            @Expect("assertion#5390: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
            @Expect("assertion#5391: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5392: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(StandardStructType<UInt8, Int64, Int16>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5393: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5394: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5395: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(StandardStructType<UInt8, Int64, Int16>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5396: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5397: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5398: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5399: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(StandardStructType<UInt8, Int64, Int16>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5400: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(StandardStructType<UInt8, Int64, Int16>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#5401: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#5402: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#5403: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(StandardStructType<UInt8, Int64, Int16>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#5404: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(StandardStructType<UInt8, Int64, Int16>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5405: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(StandardStructType<UInt8, Int64, Int16>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5406: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(StandardStructType<UInt8, Int64, Int16>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5407: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(StandardStructType<UInt8, Int64, Int16>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5408: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(StandardStructType<UInt8, Int64, Int16>(), [NonGenericClass()])
            @Expect("assertion#5409: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#5410: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#5411: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(StandardStructType<UInt8, Int64, Int16>(), [])
            @Expect("assertion#5412: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5413: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply("hello", [])
            @Expect("assertion#5414: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(StandardStructType<UInt8, Int64, Int16>(), [])
            @Expect("assertion#5415: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5416: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply("hello", [])
            @Expect("assertion#5417: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(StandardStructType<UInt8, Int64, Int16>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5418: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5419: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5420: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(StandardStructType<UInt8, Int64, Int16>(), [()])
            @Expect("assertion#5421: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5422: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_173")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5423: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_172 ends.")
    }

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
