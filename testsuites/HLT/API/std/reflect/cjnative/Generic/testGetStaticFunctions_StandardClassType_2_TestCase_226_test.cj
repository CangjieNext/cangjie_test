/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
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
class testGetStaticFunctions_StandardClassType_2 {
    @TestCase
    func TestCase_226(): Unit {
        // logger.info("testcase TestCase_226 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Float32, Int16>>().getStaticFunctions("classStaticMemberFunction_9").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [], [114.514000f32])
            @Expect("assertion#7116: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f32])
            @Expect("assertion#7117: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7118: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7119: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [], [])
            @Expect("assertion#7120: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7121: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [], [114.514000f32, 114.514000f64])
            @Expect("assertion#7122: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f32, 114.514000f64])
            @Expect("assertion#7123: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [], [()])
            @Expect("assertion#7124: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7125: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Float32, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_9")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [114.514000f32])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f32])
            @Expect("assertion#7126: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [])
            @Expect("assertion#7127: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7128: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [])
            @Expect("assertion#7129: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7130: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [114.514000f32, 114.514000f64])
            @Expect("assertion#7131: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f32, 114.514000f64])
            @Expect("assertion#7132: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, Int16>>(), [()])
            @Expect("assertion#7133: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_9")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7134: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, Int16> got.")
        }
        // logger.info("testcase TestCase_226 ends.")
    }
}
