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
class testGetInstanceFunctions_StandardClassType_6 {
    @TestCase
    func TestCase_26(): Unit {
        // logger.info("testcase TestCase_26 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Int8, Int16>>().getInstanceFunctions("classInstanceMemberFunction_27").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [], [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#755: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#756: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#757: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#758: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#759: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#760: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#761: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#762: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [], [()])
            @Expect("assertion#763: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#764: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#765: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#766: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#767: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#768: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#769: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Int8, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
            .apply(StandardClassType<Int32, Int8, Int16>(), [GenericClassWith2TypeParameters<Int8, Int8>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#770: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Int8, Int16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#771: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Int8, Int16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [])
            @Expect("assertion#772: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [])
            @Expect("assertion#773: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [])
            @Expect("assertion#774: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [])
            @Expect("assertion#775: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [])
            @Expect("assertion#776: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [])
            @Expect("assertion#777: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(),
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#778: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#779: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#780: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [()])
            @Expect("assertion#781: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#782: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [()])
            @Expect("assertion#783: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_26 ends.")
    }
}
