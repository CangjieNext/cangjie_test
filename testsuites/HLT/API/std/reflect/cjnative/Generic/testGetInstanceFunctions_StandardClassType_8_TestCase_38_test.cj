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
    func TestCase_38(): Unit {
        // logger.info("testcase TestCase_38 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Bool, Int64>>().getInstanceFunctions("classInstanceMemberFunction_39").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1103: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1104: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1105: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1106: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1107: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1108: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1109: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1110: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [], [()])
            @Expect("assertion#1111: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1112: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1113: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1114: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1115: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1116: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1117: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, Bool, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
            .apply(StandardClassType<Int64, Bool, Int64>(), [GenericStructWith1TypeParameters<Bool>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1118: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Bool, Int64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1119: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Bool, Int64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [])
            @Expect("assertion#1120: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1121: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [])
            @Expect("assertion#1122: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [])
            @Expect("assertion#1123: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1124: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [])
            @Expect("assertion#1125: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1126: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1127: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1128: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [()])
            @Expect("assertion#1129: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1130: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1131: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_38 ends.")
    }
}
