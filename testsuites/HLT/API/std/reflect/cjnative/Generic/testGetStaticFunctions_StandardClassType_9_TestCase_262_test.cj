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
    func TestCase_262(): Unit {
        // logger.info("testcase TestCase_262 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>().getStaticFunctions("classStaticMemberFunction_45").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#7800: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#7801: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7802: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7803: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [], [])
            @Expect("assertion#7804: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7805: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#7806: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#7807: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [], [()])
            @Expect("assertion#7808: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7809: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Int32, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_45")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(),
                [GenericStructWith2TypeParameters<Int32, Int32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#7810: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [])
            @Expect("assertion#7811: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7812: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [])
            @Expect("assertion#7813: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7814: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#7815: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#7816: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [()])
            @Expect("assertion#7817: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7818: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Int16> got.")
        }
        // logger.info("testcase TestCase_262 ends.")
    }
}
