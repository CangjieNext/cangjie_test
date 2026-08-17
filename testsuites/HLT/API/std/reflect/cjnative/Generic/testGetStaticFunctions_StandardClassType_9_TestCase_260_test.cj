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
class testGetStaticFunctions_StandardClassType_9 {
    @TestCase
    func TestCase_260(): Unit {
        // logger.info("testcase TestCase_260 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Unit, Int64>>().getStaticFunctions("classStaticMemberFunction_43").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#7762: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#7763: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7764: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7765: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [], [])
            @Expect("assertion#7766: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7767: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#7768: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#7769: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [], [()])
            @Expect("assertion#7770: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7771: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Unit, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_43")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(),
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#7772: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [])
            @Expect("assertion#7773: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7774: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [])
            @Expect("assertion#7775: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7776: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#7777: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#7778: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [()])
            @Expect("assertion#7779: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7780: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int64> got.")
        }
        // logger.info("testcase TestCase_260 ends.")
    }
}
