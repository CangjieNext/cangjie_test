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
class testGetInstanceFunctions_StandardClassType_5 {
    @TestCase
    func TestCase_20(): Unit {
        // logger.info("testcase TestCase_20 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Int64, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_21").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#581: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#582: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#583: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#584: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#585: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#586: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#587: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#588: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [], [()])
            @Expect("assertion#589: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#590: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#591: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#592: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#593: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#594: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#595: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Int64, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
            .apply(StandardClassType<Float32, Int64, UInt64>(), [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#596: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float32, Int64, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#597: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float32, Int64, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [])
            @Expect("assertion#598: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [])
            @Expect("assertion#599: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [])
            @Expect("assertion#600: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [])
            @Expect("assertion#601: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [])
            @Expect("assertion#602: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [])
            @Expect("assertion#603: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#604: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#605: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#606: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [()])
            @Expect("assertion#607: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#608: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [()])
            @Expect("assertion#609: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_20 ends.")
    }
}
