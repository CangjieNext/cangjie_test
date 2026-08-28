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
class testGetStaticFunctions_StandardClassType_7 {
    @TestCase
    func TestCase_252(): Unit {
        // logger.info("testcase TestCase_252 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>().getStaticFunctions("classStaticMemberFunction_35").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#7610: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#7611: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7612: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7613: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [], [])
            @Expect("assertion#7614: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7615: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7616: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7617: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [], [()])
            @Expect("assertion#7618: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7619: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, Int32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_35")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#7620: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Int32, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [])
            @Expect("assertion#7621: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7622: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Int32, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [])
            @Expect("assertion#7623: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7624: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Int32, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7625: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7626: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Int32, Float64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [()])
            @Expect("assertion#7627: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7628: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Int32, Float64> got.")
        }
        // logger.info("testcase TestCase_252 ends.")
    }
}
