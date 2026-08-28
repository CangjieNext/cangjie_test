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
    func TestCase_37(): Unit {
        // logger.info("testcase TestCase_37 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Bool, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_38").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#1074: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#1075: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1076: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1077: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1078: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#1079: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1080: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#1081: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [], [()])
            @Expect("assertion#1082: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1083: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#1084: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1085: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1086: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#1087: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1088: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Bool, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
            .apply(StandardClassType<UInt64, Bool, UInt32>(), [GenericStructWith1TypeParameters<UInt64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#1089: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, Bool, UInt32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#1090: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, Bool, UInt32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [])
            @Expect("assertion#1091: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1092: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [])
            @Expect("assertion#1093: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [])
            @Expect("assertion#1094: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1095: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [])
            @Expect("assertion#1096: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(),
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#1097: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#1098: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#1099: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [()])
            @Expect("assertion#1100: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1101: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1102: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_37 ends.")
    }
}
