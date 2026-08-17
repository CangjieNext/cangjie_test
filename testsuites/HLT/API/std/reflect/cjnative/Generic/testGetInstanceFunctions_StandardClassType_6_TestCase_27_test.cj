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
    func TestCase_27(): Unit {
        // logger.info("testcase TestCase_27 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Int32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_28").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [], [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#784: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#785: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#786: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#787: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#788: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#789: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#790: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#791: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [], [()])
            @Expect("assertion#792: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#793: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#794: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#795: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#796: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#797: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#798: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, Int32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
            .apply(StandardClassType<Bool, Int32, Int8>(), [GenericClassWith2TypeParameters<Int8, Int8>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#799: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int32, Int8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#800: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int32, Int8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [])
            @Expect("assertion#801: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [])
            @Expect("assertion#802: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [])
            @Expect("assertion#803: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [])
            @Expect("assertion#804: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [])
            @Expect("assertion#805: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [])
            @Expect("assertion#806: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(),
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#807: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#808: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#809: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [()])
            @Expect("assertion#810: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#811: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [()])
            @Expect("assertion#812: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_27 ends.")
    }
}
