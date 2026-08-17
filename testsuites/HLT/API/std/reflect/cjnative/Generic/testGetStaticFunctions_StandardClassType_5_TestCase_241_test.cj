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
class testGetStaticFunctions_StandardClassType_5 {
    @TestCase
    func TestCase_241(): Unit {
        // logger.info("testcase TestCase_241 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Int16, Int64>>().getStaticFunctions("classStaticMemberFunction_24").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7401: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7402: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7403: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7404: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [], [])
            @Expect("assertion#7405: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7406: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7407: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7408: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [], [()])
            @Expect("assertion#7409: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7410: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, Int16, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_24")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(),
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7411: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int16, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [])
            @Expect("assertion#7412: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7413: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int16, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [])
            @Expect("assertion#7414: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7415: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int16, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7416: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7417: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int16, Int64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [()])
            @Expect("assertion#7418: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7419: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int16, Int64> got.")
        }
        // logger.info("testcase TestCase_241 ends.")
    }
}
