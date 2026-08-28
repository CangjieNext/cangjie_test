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
    func TestCase_234(): Unit {
        // logger.info("testcase TestCase_234 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Float32, Float64>>().getStaticFunctions("classStaticMemberFunction_17").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#7268: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#7269: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7270: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7271: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [], [])
            @Expect("assertion#7272: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7273: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7274: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7275: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [], [()])
            @Expect("assertion#7276: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7277: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, Float32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_17")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#7278: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float32, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [])
            @Expect("assertion#7279: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7280: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float32, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [])
            @Expect("assertion#7281: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7282: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float32, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7283: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7284: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float32, Float64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float32, Float64>>(), [()])
            @Expect("assertion#7285: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_17")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7286: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float32, Float64> got.")
        }
        // logger.info("testcase TestCase_234 ends.")
    }
}
