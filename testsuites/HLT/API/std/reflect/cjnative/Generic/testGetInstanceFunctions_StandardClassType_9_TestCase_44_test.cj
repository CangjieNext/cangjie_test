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
    func TestCase_44(): Unit {
        // logger.info("testcase TestCase_44 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, UInt8, Bool>>().getInstanceFunctions("classInstanceMemberFunction_45").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [], [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#1277: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#1278: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1279: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1280: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1281: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#1282: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1283: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#1284: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [], [()])
            @Expect("assertion#1285: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1286: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#1287: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1288: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1289: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#1290: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1291: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, UInt8, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
            .apply(StandardClassType<UInt8, UInt8, Bool>(), [GenericStructWith2TypeParameters<UInt8, UInt8>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#1292: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt8, UInt8, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#1293: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt8, UInt8, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [])
            @Expect("assertion#1294: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1295: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [])
            @Expect("assertion#1296: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [])
            @Expect("assertion#1297: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1298: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [])
            @Expect("assertion#1299: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(),
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#1300: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#1301: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#1302: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [()])
            @Expect("assertion#1303: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1304: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1305: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_44 ends.")
    }
}
