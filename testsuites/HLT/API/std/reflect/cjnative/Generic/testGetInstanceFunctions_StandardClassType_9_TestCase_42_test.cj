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
class testGetInstanceFunctions_StandardClassType_9 {
    @TestCase
    func TestCase_42(): Unit {
        // logger.info("testcase TestCase_42 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int16, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_43").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#1219: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#1220: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1221: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1222: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1223: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#1224: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1225: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#1226: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [], [()])
            @Expect("assertion#1227: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1228: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#1229: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1230: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1231: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#1232: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1233: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Int16, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
            .apply(StandardClassType<UInt64, Int16, UInt64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#1234: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, Int16, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#1235: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, Int16, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [])
            @Expect("assertion#1236: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1237: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [])
            @Expect("assertion#1238: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [])
            @Expect("assertion#1239: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1240: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [])
            @Expect("assertion#1241: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#1242: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#1243: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#1244: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [()])
            @Expect("assertion#1245: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1246: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1247: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_42 ends.")
    }
}
