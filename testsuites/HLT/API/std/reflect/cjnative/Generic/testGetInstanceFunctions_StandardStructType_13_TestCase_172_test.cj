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
}
