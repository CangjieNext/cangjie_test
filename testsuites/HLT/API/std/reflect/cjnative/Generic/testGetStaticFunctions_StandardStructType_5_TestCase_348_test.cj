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
class testGetStaticFunctions_StandardStructType_5 {
    @TestCase
    func TestCase_348(): Unit {
        // logger.info("testcase TestCase_348 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>().getStaticFunctions("classStaticMemberFunction_131").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10074: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10075: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10076: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10077: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [], [])
            @Expect("assertion#10078: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10079: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10080: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10081: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [], [()])
            @Expect("assertion#10082: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10083: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, UInt64, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_131")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#10084: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt64, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [])
            @Expect("assertion#10085: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10086: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt64, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [])
            @Expect("assertion#10087: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10088: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt64, Unit> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10089: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#10090: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt64, Unit> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt64, Unit>>(), [()])
            @Expect("assertion#10091: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_131")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10092: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt64, Unit> got.")
        }
        // logger.info("testcase TestCase_348 ends.")
    }
}
