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
    func TestCase_39(): Unit {
        // logger.info("testcase TestCase_39 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt16, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_40").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [], [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#1132: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#1133: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1134: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1135: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1136: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#1137: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1138: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [],
                    [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#1139: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [], [()])
            @Expect("assertion#1140: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1141: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#1142: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1143: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1144: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#1145: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1146: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, UInt16, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
            .apply(StandardClassType<UInt32, UInt16, UInt32>(), [GenericStructWith1TypeParameters<UInt32>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#1147: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt32, UInt16, UInt32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#1148: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt32, UInt16, UInt32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [])
            @Expect("assertion#1149: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1150: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [])
            @Expect("assertion#1151: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [])
            @Expect("assertion#1152: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1153: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [])
            @Expect("assertion#1154: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(),
                    [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#1155: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#1156: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#1157: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [()])
            @Expect("assertion#1158: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1159: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1160: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_39 ends.")
    }
}
