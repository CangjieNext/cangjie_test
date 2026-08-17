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
    func TestCase_43(): Unit {
        // logger.info("testcase TestCase_43 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, UInt16, Bool>>().getInstanceFunctions("classInstanceMemberFunction_44").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#1248: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#1249: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1250: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1251: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1252: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#1253: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1254: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#1255: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [], [()])
            @Expect("assertion#1256: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1257: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#1258: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1259: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1260: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#1261: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1262: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, UInt16, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
            .apply(StandardClassType<UInt64, UInt16, Bool>(), [GenericStructWith2TypeParameters<UInt64, UInt64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#1263: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, UInt16, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#1264: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, UInt16, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [])
            @Expect("assertion#1265: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1266: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [])
            @Expect("assertion#1267: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [])
            @Expect("assertion#1268: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1269: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [])
            @Expect("assertion#1270: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(),
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#1271: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#1272: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#1273: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [()])
            @Expect("assertion#1274: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1275: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1276: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_43 ends.")
    }
}
