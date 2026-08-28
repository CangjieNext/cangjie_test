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
    func TestCase_40(): Unit {
        // logger.info("testcase TestCase_40 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int32, Unit>>().getInstanceFunctions("classInstanceMemberFunction_41").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#1161: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#1162: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1163: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1164: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1165: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#1166: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1167: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#1168: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [], [()])
            @Expect("assertion#1169: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1170: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#1171: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1172: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1173: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#1174: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1175: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Int32, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
            .apply(StandardClassType<Int16, Int32, Unit>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#1176: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int16, Int32, Unit>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#1177: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int16, Int32, Unit>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [])
            @Expect("assertion#1178: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1179: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [])
            @Expect("assertion#1180: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [])
            @Expect("assertion#1181: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1182: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [])
            @Expect("assertion#1183: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#1184: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#1185: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#1186: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [()])
            @Expect("assertion#1187: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1188: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1189: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_40 ends.")
    }
}
