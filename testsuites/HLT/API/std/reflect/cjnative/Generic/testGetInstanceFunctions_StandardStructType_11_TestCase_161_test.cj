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
class testGetInstanceFunctions_StandardStructType_11 {
    @TestCase
    func TestCase_161(): Unit {
        // logger.info("testcase TestCase_161 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Unit, Float64>>().getInstanceFunctions("classInstanceMemberFunction_162").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, Unit, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
            .apply(StandardStructType<Float32, Unit, Float64>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [1u16])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [1u16])
            @Expect("assertion#5016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [1u16])
            @Expect("assertion#5017: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5018: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5019: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5020: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5021: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5022: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5023: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [1u16, 114.514000f64])
            @Expect("assertion#5024: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [1u16, 114.514000f64])
            @Expect("assertion#5025: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [1u16, 114.514000f64])
            @Expect("assertion#5026: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#5027: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#5028: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#5029: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [1u16])
            @Expect("assertion#5030: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5031: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5032: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [1u16, 114.514000f64])
            @Expect("assertion#5033: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#5034: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [1u16])
            @Expect("assertion#5035: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [1u16])
            @Expect("assertion#5036: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [1u16])
            @Expect("assertion#5037: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [])
            @Expect("assertion#5038: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5039: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [])
            @Expect("assertion#5040: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [])
            @Expect("assertion#5041: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5042: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [])
            @Expect("assertion#5043: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [1u16, 114.514000f64])
            @Expect("assertion#5044: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [1u16, 114.514000f64])
            @Expect("assertion#5045: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [1u16, 114.514000f64])
            @Expect("assertion#5046: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [114.514000f64])
            @Expect("assertion#5047: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#5048: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#5049: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_161 ends.")
    }
}
