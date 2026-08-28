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
class testGetInstanceFunctions_StandardStructType_7 {
    @TestCase
    func TestCase_143(): Unit {
        // logger.info("testcase TestCase_143 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Float64, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_144").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4464: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4465: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4466: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4467: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4468: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4469: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4470: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4471: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [], [()])
            @Expect("assertion#4472: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4473: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4474: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4475: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4476: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4477: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4478: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Float64, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
            .apply(StandardStructType<UInt32, Float64, UInt32>(), [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4479: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt32, Float64, UInt32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4480: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt32, Float64, UInt32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [])
            @Expect("assertion#4481: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4482: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [])
            @Expect("assertion#4483: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [])
            @Expect("assertion#4484: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4485: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [])
            @Expect("assertion#4486: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4487: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4488: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4489: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [()])
            @Expect("assertion#4490: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4491: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4492: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_143 ends.")
    }
}
