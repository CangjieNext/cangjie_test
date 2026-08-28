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
    func TestCase_224(): Unit {
        // logger.info("testcase TestCase_224 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>().getStaticFunctions("classStaticMemberFunction_7").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [], [()])
            @Expect("assertion#7078: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7079: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7080: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7081: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [], [])
            @Expect("assertion#7082: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7083: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [], [(), 114.514000f64])
            @Expect("assertion#7084: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#7085: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [], [123i64])
            @Expect("assertion#7086: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#7087: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, Float64, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_7")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7088: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Float64, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [])
            @Expect("assertion#7089: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7090: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Float64, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [])
            @Expect("assertion#7091: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7092: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Float64, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [(), 114.514000f64])
            @Expect("assertion#7093: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [(), 114.514000f64])
            @Expect("assertion#7094: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Float64, Int32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Float64, Int32>>(), [123i64])
            @Expect("assertion#7095: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Float64, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_7")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#7096: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Float64, Int32> got.")
        }
        // logger.info("testcase TestCase_224 ends.")
    }
}
