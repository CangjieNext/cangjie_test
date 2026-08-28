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
    func TestCase_163(): Unit {
        // logger.info("testcase TestCase_163 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, UInt8, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_164").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, UInt8, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
            .apply(StandardStructType<Float64, UInt8, UInt64>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [1u32])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [1u32])
            @Expect("assertion#5084: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [1u32])
            @Expect("assertion#5085: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5086: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5087: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5088: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5089: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5090: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5091: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [1u32, 114.514000f64])
            @Expect("assertion#5092: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [1u32, 114.514000f64])
            @Expect("assertion#5093: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [1u32, 114.514000f64])
            @Expect("assertion#5094: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [114.514000f64])
            @Expect("assertion#5095: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [114.514000f64])
            @Expect("assertion#5096: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#5097: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [1u32])
            @Expect("assertion#5098: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5099: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5100: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [1u32, 114.514000f64])
            @Expect("assertion#5101: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#5102: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [1u32])
            @Expect("assertion#5103: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [1u32])
            @Expect("assertion#5104: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [1u32])
            @Expect("assertion#5105: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [])
            @Expect("assertion#5106: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5107: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [])
            @Expect("assertion#5108: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [])
            @Expect("assertion#5109: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5110: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [])
            @Expect("assertion#5111: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [1u32, 114.514000f64])
            @Expect("assertion#5112: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [1u32, 114.514000f64])
            @Expect("assertion#5113: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [1u32, 114.514000f64])
            @Expect("assertion#5114: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [114.514000f64])
            @Expect("assertion#5115: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#5116: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#5117: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_163 ends.")
    }
}
