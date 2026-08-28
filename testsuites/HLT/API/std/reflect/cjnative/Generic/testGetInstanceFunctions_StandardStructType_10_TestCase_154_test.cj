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
class testGetInstanceFunctions_StandardStructType_10 {
    @TestCase
    func TestCase_154(): Unit {
        // logger.info("testcase TestCase_154 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, UInt64, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_155").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#4783: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#4784: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4785: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4786: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4787: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#4788: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4789: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#4790: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [], [()])
            @Expect("assertion#4791: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4792: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#4793: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4794: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4795: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#4796: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4797: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, UInt64, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
            .apply(StandardStructType<UInt16, UInt64, UInt32>(), [GenericStructWith2TypeParameters<UInt32, UInt32>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#4798: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, UInt64, UInt32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#4799: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, UInt64, UInt32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [])
            @Expect("assertion#4800: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4801: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [])
            @Expect("assertion#4802: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [])
            @Expect("assertion#4803: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4804: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [])
            @Expect("assertion#4805: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(),
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#4806: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#4807: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#4808: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [()])
            @Expect("assertion#4809: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4810: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4811: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_154 ends.")
    }
}
