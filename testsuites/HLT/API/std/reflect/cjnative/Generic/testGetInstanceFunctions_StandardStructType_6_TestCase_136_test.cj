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
class testGetInstanceFunctions_StandardStructType_6 {
    @TestCase
    func TestCase_136(): Unit {
        // logger.info("testcase TestCase_136 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int16, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_137").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#4261: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#4262: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4263: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4264: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4265: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#4266: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4267: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#4268: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [], [()])
            @Expect("assertion#4269: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4270: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#4271: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4272: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4273: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#4274: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4275: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Int16, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
            .apply(StandardStructType<Int32, Int16, UInt64>(), [GenericClassWith2TypeParameters<UInt64, UInt64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#4276: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int16, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#4277: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int16, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [])
            @Expect("assertion#4278: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4279: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [])
            @Expect("assertion#4280: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [])
            @Expect("assertion#4281: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4282: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [])
            @Expect("assertion#4283: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(),
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#4284: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#4285: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#4286: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [()])
            @Expect("assertion#4287: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4288: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4289: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_136 ends.")
    }
}
