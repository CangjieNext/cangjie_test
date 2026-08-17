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
class testGetStaticFunctions_StandardStructType_6 {
    @TestCase
    func TestCase_352(): Unit {
        // logger.info("testcase TestCase_352 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>().getStaticFunctions("classStaticMemberFunction_135").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#10150: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#10151: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10152: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10153: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [], [])
            @Expect("assertion#10154: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10155: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#10156: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#10157: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [], [()])
            @Expect("assertion#10158: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10159: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Float32, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_135")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(),
                [GenericClassWith2TypeParameters<UInt8, UInt8>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#10160: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [])
            @Expect("assertion#10161: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10162: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [])
            @Expect("assertion#10163: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10164: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(),
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#10165: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#10166: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Float32, Int16>>(), [()])
            @Expect("assertion#10167: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_135")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10168: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Float32, Int16> got.")
        }
        // logger.info("testcase TestCase_352 ends.")
    }
}
