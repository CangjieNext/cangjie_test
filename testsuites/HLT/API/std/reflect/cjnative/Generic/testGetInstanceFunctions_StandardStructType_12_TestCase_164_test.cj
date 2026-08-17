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
    func TestCase_164(): Unit {
        // logger.info("testcase TestCase_164 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int64, Int8>>().getInstanceFunctions("classInstanceMemberFunction_165").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Int64, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
            .apply(StandardStructType<Int64, Int64, Int8>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [NonGenericClass()])
            @Expect("assertion#5118: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [NonGenericClass()])
            @Expect("assertion#5119: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5120: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5121: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5122: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5123: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5124: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5125: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5126: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5127: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5128: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#5129: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#5130: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#5131: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#5132: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5133: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5134: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5135: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5136: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [NonGenericClass()])
            @Expect("assertion#5137: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#5138: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#5139: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [])
            @Expect("assertion#5140: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5141: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [])
            @Expect("assertion#5142: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [])
            @Expect("assertion#5143: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5144: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [])
            @Expect("assertion#5145: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5146: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5147: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5148: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(StandardStructType<Int64, Int64, Int8>(), [()])
            @Expect("assertion#5149: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5150: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_165")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5151: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_164 ends.")
    }
}
