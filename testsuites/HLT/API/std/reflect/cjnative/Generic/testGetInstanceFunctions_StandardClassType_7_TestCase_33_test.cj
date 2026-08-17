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
    func TestCase_33(): Unit {
        // logger.info("testcase TestCase_33 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Int16, Int32>>().getInstanceFunctions("classInstanceMemberFunction_34").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [], [NonGenericStruct()])
            @Expect("assertion#958: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#959: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#960: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#961: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#962: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#963: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#964: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#965: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [], [()])
            @Expect("assertion#966: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#967: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#968: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#969: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#970: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#971: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#972: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Int16, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
            .apply(StandardClassType<Float32, Int16, Int32>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#973: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float32, Int16, Int32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#974: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float32, Int16, Int32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [])
            @Expect("assertion#975: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [])
            @Expect("assertion#976: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [])
            @Expect("assertion#977: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [])
            @Expect("assertion#978: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [])
            @Expect("assertion#979: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [])
            @Expect("assertion#980: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#981: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#982: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#983: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [()])
            @Expect("assertion#984: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#985: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [()])
            @Expect("assertion#986: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_33 ends.")
    }
}
