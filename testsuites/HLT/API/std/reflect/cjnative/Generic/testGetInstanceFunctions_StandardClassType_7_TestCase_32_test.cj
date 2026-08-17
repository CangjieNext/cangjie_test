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
class testGetInstanceFunctions_StandardClassType_7 {
    @TestCase
    func TestCase_32(): Unit {
        // logger.info("testcase TestCase_32 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, Unit, Int8>>().getInstanceFunctions("classInstanceMemberFunction_33").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [], [NonGenericStruct()])
            @Expect("assertion#929: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#930: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#931: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#932: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#933: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#934: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#935: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#936: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [], [()])
            @Expect("assertion#937: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#938: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#939: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#940: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#941: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#942: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#943: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, Unit, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
            .apply(StandardClassType<Float64, Unit, Int8>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#944: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float64, Unit, Int8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#945: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float64, Unit, Int8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [])
            @Expect("assertion#946: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [])
            @Expect("assertion#947: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [])
            @Expect("assertion#948: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [])
            @Expect("assertion#949: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [])
            @Expect("assertion#950: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [])
            @Expect("assertion#951: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#952: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#953: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#954: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [()])
            @Expect("assertion#955: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#956: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [()])
            @Expect("assertion#957: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_32 ends.")
    }
}
