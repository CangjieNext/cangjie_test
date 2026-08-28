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
class testGetInstanceFunctions_StandardStructType_9 {
    @TestCase
    func TestCase_153(): Unit {
        // logger.info("testcase TestCase_153 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Bool, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_154").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4754: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4755: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4756: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4757: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4758: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4759: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4760: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4761: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [], [()])
            @Expect("assertion#4762: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4763: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4764: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4765: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4766: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4767: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4768: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Bool, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
            .apply(StandardStructType<Int32, Bool, UInt8>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4769: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Bool, UInt8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4770: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Bool, UInt8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [])
            @Expect("assertion#4771: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4772: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [])
            @Expect("assertion#4773: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [])
            @Expect("assertion#4774: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4775: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [])
            @Expect("assertion#4776: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4777: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4778: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4779: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [()])
            @Expect("assertion#4780: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4781: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4782: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_153 ends.")
    }
}
