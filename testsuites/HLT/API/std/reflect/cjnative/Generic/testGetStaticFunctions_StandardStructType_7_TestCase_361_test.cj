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
class testGetStaticFunctions_StandardStructType_7 {
    @TestCase
    func TestCase_361(): Unit {
        // logger.info("testcase TestCase_361 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>().getStaticFunctions("classStaticMemberFunction_144").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#10321: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#10322: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10323: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10324: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [], [])
            @Expect("assertion#10325: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10326: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#10327: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#10328: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [], [()])
            @Expect("assertion#10329: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10330: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Unit, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_144")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#10331: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [])
            @Expect("assertion#10332: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10333: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [])
            @Expect("assertion#10334: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10335: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#10336: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#10337: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [()])
            @Expect("assertion#10338: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10339: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt8> got.")
        }
        // logger.info("testcase TestCase_361 ends.")
    }
}
