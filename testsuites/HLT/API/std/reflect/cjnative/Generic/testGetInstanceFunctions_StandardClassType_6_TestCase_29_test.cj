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
class testGetInstanceFunctions_StandardClassType_6 {
    @TestCase
    func TestCase_29(): Unit {
        // logger.info("testcase TestCase_29 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Int64, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_30").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [], [NonGenericStruct()])
            @Expect("assertion#842: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#843: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#844: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#845: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#846: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#847: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#848: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#849: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [], [()])
            @Expect("assertion#850: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#851: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#852: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#853: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#854: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#855: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#856: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, Int64, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
            .apply(StandardClassType<Int64, Int64, UInt8>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#857: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Int64, UInt8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#858: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Int64, UInt8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [])
            @Expect("assertion#859: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [])
            @Expect("assertion#860: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [])
            @Expect("assertion#861: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [])
            @Expect("assertion#862: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [])
            @Expect("assertion#863: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [])
            @Expect("assertion#864: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#865: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#866: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#867: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [()])
            @Expect("assertion#868: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#869: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [()])
            @Expect("assertion#870: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_29 ends.")
    }
}
