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
class testGetInstanceFunctions_StandardStructType_8 {
    @TestCase
    func TestCase_147(): Unit {
        // logger.info("testcase TestCase_147 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Int16, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_148").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [], [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#4580: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#4581: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4582: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4583: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4584: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#4585: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4586: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#4587: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [], [()])
            @Expect("assertion#4588: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4589: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#4590: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4591: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4592: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#4593: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4594: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Int16, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
            .apply(StandardStructType<UInt8, Int16, UInt64>(), [GenericStructWith1TypeParameters<Int16>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#4595: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt8, Int16, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#4596: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt8, Int16, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [])
            @Expect("assertion#4597: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4598: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [])
            @Expect("assertion#4599: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [])
            @Expect("assertion#4600: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4601: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [])
            @Expect("assertion#4602: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(),
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#4603: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#4604: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#4605: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(StandardStructType<UInt8, Int16, UInt64>(), [()])
            @Expect("assertion#4606: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4607: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_148")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4608: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_147 ends.")
    }
}
