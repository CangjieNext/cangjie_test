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
    func TestCase_166(): Unit {
        // logger.info("testcase TestCase_166 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Bool, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_167").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Bool, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
            .apply(StandardStructType<Int64, Bool, UInt16>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [NonGenericClass()])
            @Expect("assertion#5186: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#5187: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5188: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5189: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5190: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5191: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5192: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5193: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5194: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5195: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5196: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5197: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5198: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#5199: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#5200: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5201: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5202: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5203: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5204: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [NonGenericClass()])
            @Expect("assertion#5205: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#5206: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#5207: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [])
            @Expect("assertion#5208: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5209: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [])
            @Expect("assertion#5210: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [])
            @Expect("assertion#5211: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5212: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [])
            @Expect("assertion#5213: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5214: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5215: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5216: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(StandardStructType<Int64, Bool, UInt16>(), [()])
            @Expect("assertion#5217: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5218: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_167")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5219: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_166 ends.")
    }
}
