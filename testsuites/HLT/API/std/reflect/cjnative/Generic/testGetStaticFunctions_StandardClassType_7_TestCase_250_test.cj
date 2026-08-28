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
class testGetStaticFunctions_StandardClassType_7 {
    @TestCase
    func TestCase_250(): Unit {
        // logger.info("testcase TestCase_250 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>().getStaticFunctions("classStaticMemberFunction_33").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [], [NonGenericStruct()])
            @Expect("assertion#7572: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#7573: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7574: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7575: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [], [])
            @Expect("assertion#7576: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7577: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7578: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7579: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [], [()])
            @Expect("assertion#7580: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7581: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, UInt8, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_33")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#7582: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt8, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [])
            @Expect("assertion#7583: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7584: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt8, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [])
            @Expect("assertion#7585: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7586: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt8, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7587: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7588: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt8, UInt32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [()])
            @Expect("assertion#7589: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7590: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt8, UInt32> got.")
        }
        // logger.info("testcase TestCase_250 ends.")
    }
}
