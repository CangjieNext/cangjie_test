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
    func TestCase_362(): Unit {
        // logger.info("testcase TestCase_362 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Int32, Int8>>().getStaticFunctions("classStaticMemberFunction_145").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#10340: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#10341: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10342: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10343: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [], [])
            @Expect("assertion#10344: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10345: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10346: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10347: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [], [()])
            @Expect("assertion#10348: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10349: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, Int32, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_145")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [GenericStructWith1TypeParameters<Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#10350: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [])
            @Expect("assertion#10351: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10352: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [])
            @Expect("assertion#10353: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10354: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Int8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10355: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#10356: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Int8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int32, Int8>>(), [()])
            @Expect("assertion#10357: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_145")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10358: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int32, Int8> got.")
        }
        // logger.info("testcase TestCase_362 ends.")
    }
}
