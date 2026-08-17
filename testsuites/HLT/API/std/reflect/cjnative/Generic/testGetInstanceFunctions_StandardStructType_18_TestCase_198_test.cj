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
class testGetInstanceFunctions_StandardStructType_18 {
    @TestCase
    func TestCase_198(): Unit {
        // logger.info("testcase TestCase_198 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Bool, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_199").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Bool, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
            .apply(StandardStructType<Int32, Bool, UInt16>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
            @Expect("assertion#6274: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
            @Expect("assertion#6275: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6276: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6277: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6278: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6279: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6280: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6281: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6282: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6283: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6284: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#6285: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#6286: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#6287: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#6288: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6289: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6290: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6291: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6292: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [NonGenericStruct()])
            @Expect("assertion#6293: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#6294: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#6295: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [])
            @Expect("assertion#6296: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6297: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [])
            @Expect("assertion#6298: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [])
            @Expect("assertion#6299: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6300: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [])
            @Expect("assertion#6301: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6302: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6303: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6304: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt16>(), [()])
            @Expect("assertion#6305: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6306: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_199")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6307: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_198 ends.")
    }
}
