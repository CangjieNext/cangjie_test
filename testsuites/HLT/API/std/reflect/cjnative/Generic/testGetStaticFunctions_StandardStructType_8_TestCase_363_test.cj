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
class testGetStaticFunctions_StandardStructType_8 {
    @TestCase
    func TestCase_363(): Unit {
        // logger.info("testcase TestCase_363 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>().getStaticFunctions("classStaticMemberFunction_146").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#10359: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#10360: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10361: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10362: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [], [])
            @Expect("assertion#10363: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10364: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10365: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10366: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [], [()])
            @Expect("assertion#10367: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10368: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, UInt32, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_146")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [GenericStructWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#10369: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt32, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [])
            @Expect("assertion#10370: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10371: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt32, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [])
            @Expect("assertion#10372: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10373: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt32, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(),
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10374: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10375: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt32, Unit> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt32, Unit>>(), [()])
            @Expect("assertion#10376: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_146")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10377: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt32, Unit> got.")
        }
        // logger.info("testcase TestCase_363 ends.")
    }
}
