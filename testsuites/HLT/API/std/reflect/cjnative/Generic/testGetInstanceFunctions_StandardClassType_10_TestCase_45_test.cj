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
class testGetInstanceFunctions_StandardClassType_10 {
    @TestCase
    func TestCase_45(): Unit {
        // logger.info("testcase TestCase_45 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Int8, Float32>>().getInstanceFunctions("classInstanceMemberFunction_46").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#1306: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#1307: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1308: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1309: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1310: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#1311: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1312: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#1313: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [], [()])
            @Expect("assertion#1314: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1315: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#1316: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1317: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1318: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#1319: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1320: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, Int8, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
            .apply(StandardClassType<UInt16, Int8, Float32>(), [GenericStructWith2TypeParameters<Float32, Float32>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#1321: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt16, Int8, Float32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#1322: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt16, Int8, Float32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [])
            @Expect("assertion#1323: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1324: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [])
            @Expect("assertion#1325: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [])
            @Expect("assertion#1326: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1327: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [])
            @Expect("assertion#1328: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(),
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#1329: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#1330: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#1331: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [()])
            @Expect("assertion#1332: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1333: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1334: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_45 ends.")
    }
}
