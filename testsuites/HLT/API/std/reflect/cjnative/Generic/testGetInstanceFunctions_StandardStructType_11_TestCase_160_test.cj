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
    func TestCase_160(): Unit {
        // logger.info("testcase TestCase_160 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int32, Int16>>().getInstanceFunctions("classInstanceMemberFunction_161").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Int32, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
            .apply(StandardStructType<Float64, Int32, Int16>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [1i16])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [1i16])
            @Expect("assertion#4982: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [1i16])
            @Expect("assertion#4983: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#4984: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#4985: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#4986: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#4987: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#4988: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#4989: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [1i16, 114.514000f64])
            @Expect("assertion#4990: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [1i16, 114.514000f64])
            @Expect("assertion#4991: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [1i16, 114.514000f64])
            @Expect("assertion#4992: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#4993: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#4994: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#4995: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [1i16])
            @Expect("assertion#4996: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#4997: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#4998: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [1i16, 114.514000f64])
            @Expect("assertion#4999: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#5000: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [1i16])
            @Expect("assertion#5001: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [1i16])
            @Expect("assertion#5002: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [1i16])
            @Expect("assertion#5003: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [])
            @Expect("assertion#5004: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5005: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [])
            @Expect("assertion#5006: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [])
            @Expect("assertion#5007: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5008: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [])
            @Expect("assertion#5009: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [1i16, 114.514000f64])
            @Expect("assertion#5010: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [1i16, 114.514000f64])
            @Expect("assertion#5011: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [1i16, 114.514000f64])
            @Expect("assertion#5012: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [114.514000f64])
            @Expect("assertion#5013: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#5014: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#5015: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_160 ends.")
    }
}
