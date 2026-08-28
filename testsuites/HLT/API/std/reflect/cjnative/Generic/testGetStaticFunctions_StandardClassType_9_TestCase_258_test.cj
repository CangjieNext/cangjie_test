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
class testGetStaticFunctions_StandardClassType_9 {
    @TestCase
    func TestCase_258(): Unit {
        // logger.info("testcase TestCase_258 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>().getStaticFunctions("classStaticMemberFunction_41").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#7724: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#7725: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7726: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7727: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [], [])
            @Expect("assertion#7728: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7729: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7730: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7731: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [], [()])
            @Expect("assertion#7732: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7733: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, UInt64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_41")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(),
                [GenericStructWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#7734: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt64, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [])
            @Expect("assertion#7735: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7736: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt64, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [])
            @Expect("assertion#7737: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7738: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt64, UInt16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7739: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7740: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt64, UInt16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [()])
            @Expect("assertion#7741: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7742: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt64, UInt16> got.")
        }
        // logger.info("testcase TestCase_258 ends.")
    }
}
