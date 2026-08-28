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
    func TestCase_152(): Unit {
        // logger.info("testcase TestCase_152 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Float64, Int16>>().getInstanceFunctions("classInstanceMemberFunction_153").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#4725: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#4726: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4727: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4728: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4729: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#4730: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4731: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#4732: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [], [()])
            @Expect("assertion#4733: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4734: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#4735: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4736: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4737: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#4738: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4739: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Float64, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
            .apply(StandardStructType<UInt16, Float64, Int16>(), [GenericStructWith2TypeParameters<UInt16, UInt16>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#4740: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, Float64, Int16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#4741: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, Float64, Int16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [])
            @Expect("assertion#4742: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4743: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [])
            @Expect("assertion#4744: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [])
            @Expect("assertion#4745: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4746: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [])
            @Expect("assertion#4747: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(),
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#4748: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#4749: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#4750: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [()])
            @Expect("assertion#4751: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4752: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4753: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_152 ends.")
    }
}
