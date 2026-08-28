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
class testGetInstanceFunctions_StandardClassType_8 {
    @TestCase
    func TestCase_36(): Unit {
        // logger.info("testcase TestCase_36 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Int32, Bool>>().getInstanceFunctions("classInstanceMemberFunction_37").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#1045: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#1046: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1047: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1048: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1049: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#1050: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1051: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#1052: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [], [()])
            @Expect("assertion#1053: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1054: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#1055: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1056: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1057: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#1058: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1059: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, Int32, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
            .apply(StandardClassType<Bool, Int32, Bool>(), [GenericStructWith1TypeParameters<Unit>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#1060: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int32, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#1061: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int32, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [])
            @Expect("assertion#1062: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1063: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [])
            @Expect("assertion#1064: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [])
            @Expect("assertion#1065: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1066: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [])
            @Expect("assertion#1067: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#1068: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#1069: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#1070: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [()])
            @Expect("assertion#1071: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1072: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1073: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_36 ends.")
    }
}
