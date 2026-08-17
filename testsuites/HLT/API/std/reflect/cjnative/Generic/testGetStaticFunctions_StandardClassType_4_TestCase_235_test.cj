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
    func TestCase_235(): Unit {
        // logger.info("testcase TestCase_235 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Unit, Int16>>().getStaticFunctions("classStaticMemberFunction_18").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#7287: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#7288: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7289: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7290: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [], [])
            @Expect("assertion#7291: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7292: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#7293: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#7294: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [], [()])
            @Expect("assertion#7295: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7296: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, Unit, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_18")[0i64]
            .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#7297: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [])
            @Expect("assertion#7298: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7299: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [])
            @Expect("assertion#7300: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7301: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#7302: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#7303: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int16>>(), [()])
            @Expect("assertion#7304: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_18")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7305: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int16> got.")
        }
        // logger.info("testcase TestCase_235 ends.")
    }
}
