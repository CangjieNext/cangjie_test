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
class testGetInstanceFunctions_StandardStructType_12 {
    @TestCase
    func TestCase_167(): Unit {
        // logger.info("testcase TestCase_167 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, Int32, Float32>>().getInstanceFunctions("classInstanceMemberFunction_168").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, Int32, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
            .apply(StandardStructType<UInt64, Int32, Float32>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#5220: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
            @Expect("assertion#5221: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5222: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5223: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello",
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5224: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5225: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5226: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5227: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5228: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5229: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5230: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#5231: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#5232: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#5233: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#5234: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5235: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5236: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5237: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5238: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [NonGenericClass()])
            @Expect("assertion#5239: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#5240: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#5241: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [])
            @Expect("assertion#5242: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5243: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [])
            @Expect("assertion#5244: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [])
            @Expect("assertion#5245: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5246: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [])
            @Expect("assertion#5247: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5248: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5249: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5250: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(StandardStructType<UInt64, Int32, Float32>(), [()])
            @Expect("assertion#5251: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5252: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_168")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5253: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_167 ends.")
    }
}
