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
class testGetStaticFunctions_StandardStructType_9 {
    @TestCase
    func TestCase_368(): Unit {
        // logger.info("testcase TestCase_368 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>().getStaticFunctions("classStaticMemberFunction_151").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#10454: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#10455: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10456: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10457: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [], [])
            @Expect("assertion#10458: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10459: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#10460: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#10461: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [], [()])
            @Expect("assertion#10462: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10463: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Int32, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_151")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(),
                [GenericStructWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#10464: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [])
            @Expect("assertion#10465: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10466: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [])
            @Expect("assertion#10467: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10468: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#10469: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#10470: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, UInt32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [()])
            @Expect("assertion#10471: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10472: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, UInt32> got.")
        }
        // logger.info("testcase TestCase_368 ends.")
    }
}
