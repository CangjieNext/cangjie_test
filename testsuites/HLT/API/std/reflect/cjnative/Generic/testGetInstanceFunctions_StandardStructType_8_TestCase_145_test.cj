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
    func TestCase_145(): Unit {
        // logger.info("testcase TestCase_145 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Float32, Int64>>().getInstanceFunctions("classInstanceMemberFunction_146").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#4522: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#4523: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4524: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4525: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4526: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4527: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4528: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4529: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [], [()])
            @Expect("assertion#4530: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4531: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#4532: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4533: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4534: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4535: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4536: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Float32, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
            .apply(StandardStructType<Int64, Float32, Int64>(), [GenericStructWith1TypeParameters<Unit>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#4537: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Float32, Int64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#4538: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Float32, Int64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [])
            @Expect("assertion#4539: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4540: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [])
            @Expect("assertion#4541: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [])
            @Expect("assertion#4542: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4543: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [])
            @Expect("assertion#4544: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(),
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4545: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4546: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4547: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(StandardStructType<Int64, Float32, Int64>(), [()])
            @Expect("assertion#4548: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4549: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Float32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_146")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4550: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_145 ends.")
    }
}
