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
class testGetStaticFunctions_StandardClassType_4 {
    @TestCase
    func TestCase_236(): Unit {
        // logger.info("testcase TestCase_236 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>().getStaticFunctions("classStaticMemberFunction_19").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#7306: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#7307: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7308: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7309: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [], [])
            @Expect("assertion#7310: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7311: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#7312: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#7313: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [], [()])
            @Expect("assertion#7314: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7315: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, UInt8, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_19")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#7316: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [])
            @Expect("assertion#7317: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7318: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [])
            @Expect("assertion#7319: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7320: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#7321: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#7322: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [()])
            @Expect("assertion#7323: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_19")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7324: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("testcase TestCase_236 ends.")
    }
}
