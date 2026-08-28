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
class testGetStaticFunctions_StandardStructType_1 {
    @TestCase
    func TestCase_327(): Unit {
        // logger.info("testcase TestCase_327 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, UInt8, UInt32>>().getStaticFunctions("classStaticMemberFunction_110").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_110")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt8, UInt32>>(), [], [])
            @Expect("assertion#9665: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_110")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9666: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_110")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [114.514000f64])
            @Expect("assertion#9667: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_110")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt8, UInt32>>(), [TypeInfo.of<Float32>()],
                    [114.514000f64])
            @Expect("assertion#9668: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, UInt8, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_110")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, UInt8, UInt32>>(), [])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_110")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9669: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt8, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_110")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt8, UInt32>>(), [114.514000f64])
            @Expect("assertion#9670: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_110")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#9671: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt8, UInt32> got.")
        }
        // logger.info("testcase TestCase_327 ends.")
    }
}
