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
class testGetStaticFunctions_StandardClassType_8 {
    @TestCase
    func TestCase_254(): Unit {
        // logger.info("testcase TestCase_254 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>().getStaticFunctions("classStaticMemberFunction_37").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(), [],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#7648: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#7649: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7650: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7651: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(), [], [])
            @Expect("assertion#7652: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7653: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(), [],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#7654: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#7655: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(), [], [()])
            @Expect("assertion#7656: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7657: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, UInt8, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_37")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(), [GenericStructWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#7658: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt8, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(), [])
            @Expect("assertion#7659: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7660: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt8, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(), [])
            @Expect("assertion#7661: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7662: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt8, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(),
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#7663: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#7664: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt8, Int64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt8, Int64>>(), [()])
            @Expect("assertion#7665: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt8, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_37")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7666: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, UInt8, Int64> got.")
        }
        // logger.info("testcase TestCase_254 ends.")
    }
}
