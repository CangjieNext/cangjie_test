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
class testGetInstanceFunctions_StandardStructType_5 {
    @TestCase
    func TestCase_130(): Unit {
        // logger.info("testcase TestCase_130 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Float32, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_131").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#4087: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#4088: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4089: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4090: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4091: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#4092: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4093: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#4094: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [], [()])
            @Expect("assertion#4095: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4096: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#4097: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4098: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4099: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#4100: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4101: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Float32, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
            .apply(StandardStructType<UInt32, Float32, UInt64>(), [GenericClassWith1TypeParameters<UInt64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#4102: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt32, Float32, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#4103: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt32, Float32, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [])
            @Expect("assertion#4104: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4105: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [])
            @Expect("assertion#4106: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [])
            @Expect("assertion#4107: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4108: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [])
            @Expect("assertion#4109: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(),
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#4110: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#4111: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#4112: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [()])
            @Expect("assertion#4113: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4114: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4115: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_130 ends.")
    }
}
