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
class testGetInstanceFunctions_StandardStructType_9 {
    @TestCase
    func TestCase_149(): Unit {
        // logger.info("testcase TestCase_149 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>().getInstanceFunctions("classInstanceMemberFunction_150").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4638: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4639: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4640: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4641: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4642: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4643: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4644: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4645: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [], [()])
            @Expect("assertion#4646: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4647: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4648: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4649: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4650: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4651: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4652: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, Int8, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
            .apply(StandardStructType<UInt64, Int8, Int8>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4653: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt64, Int8, Int8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4654: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt64, Int8, Int8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [])
            @Expect("assertion#4655: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4656: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [])
            @Expect("assertion#4657: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [])
            @Expect("assertion#4658: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4659: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [])
            @Expect("assertion#4660: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4661: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4662: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4663: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [()])
            @Expect("assertion#4664: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4665: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4666: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_149 ends.")
    }
}
