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
class testGetInstanceFunctions_StandardStructType_4 {
    @TestCase
    func TestCase_125(): Unit {
        // logger.info("testcase TestCase_125 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt64, Int64>>().getInstanceFunctions("classInstanceMemberFunction_126").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#3942: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#3943: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3944: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3945: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3946: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3947: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3948: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3949: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [], [()])
            @Expect("assertion#3950: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3951: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#3952: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3953: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3954: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3955: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3956: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, UInt64, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
            .apply(StandardStructType<Bool, UInt64, Int64>(), [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#3957: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Bool, UInt64, Int64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#3958: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Bool, UInt64, Int64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [])
            @Expect("assertion#3959: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3960: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [])
            @Expect("assertion#3961: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [])
            @Expect("assertion#3962: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3963: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [])
            @Expect("assertion#3964: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3965: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3966: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3967: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [()])
            @Expect("assertion#3968: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3969: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3970: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_125 ends.")
    }
}
