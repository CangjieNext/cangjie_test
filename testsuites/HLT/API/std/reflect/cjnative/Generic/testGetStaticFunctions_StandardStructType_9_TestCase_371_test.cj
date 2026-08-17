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
class testGetStaticFunctions_StandardStructType_9 {
    @TestCase
    func TestCase_371(): Unit {
        // logger.info("testcase TestCase_371 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Float32, Int16>>().getStaticFunctions("classStaticMemberFunction_154").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#10511: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#10512: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10513: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10514: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [], [])
            @Expect("assertion#10515: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10516: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10517: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10518: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [], [()])
            @Expect("assertion#10519: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10520: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, Float32, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_154")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(),
                [GenericStructWith2TypeParameters<Float32, Float32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#10521: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [])
            @Expect("assertion#10522: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10523: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [])
            @Expect("assertion#10524: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10525: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(),
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10526: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10527: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Float32, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [()])
            @Expect("assertion#10528: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10529: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Float32, Int16> got.")
        }
        // logger.info("testcase TestCase_371 ends.")
    }
}
