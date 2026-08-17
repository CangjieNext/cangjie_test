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
    func TestCase_30(): Unit {
        // logger.info("testcase TestCase_30 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Int64, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_31").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [], [NonGenericStruct()])
            @Expect("assertion#871: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#872: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#873: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#874: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#875: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#876: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#877: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#878: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [], [()])
            @Expect("assertion#879: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#880: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#881: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#882: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#883: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#884: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#885: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Int64, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
            .apply(StandardClassType<UInt8, Int64, UInt16>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#886: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt8, Int64, UInt16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#887: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt8, Int64, UInt16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [])
            @Expect("assertion#888: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [])
            @Expect("assertion#889: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [])
            @Expect("assertion#890: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [])
            @Expect("assertion#891: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [])
            @Expect("assertion#892: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [])
            @Expect("assertion#893: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#894: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#895: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#896: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [()])
            @Expect("assertion#897: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#898: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [()])
            @Expect("assertion#899: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_30 ends.")
    }
}
