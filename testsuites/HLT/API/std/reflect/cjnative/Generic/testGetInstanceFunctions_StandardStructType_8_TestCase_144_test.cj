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
class testGetInstanceFunctions_StandardStructType_8 {
    @TestCase
    func TestCase_144(): Unit {
        // logger.info("testcase TestCase_144 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int32, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_145").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#4493: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#4494: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4495: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4496: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4497: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#4498: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4499: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#4500: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [], [()])
            @Expect("assertion#4501: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4502: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#4503: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4504: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4505: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#4506: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4507: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Int32, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
            .apply(StandardStructType<Int64, Int32, UInt64>(), [GenericStructWith1TypeParameters<Bool>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#4508: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Int32, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#4509: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Int32, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [])
            @Expect("assertion#4510: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4511: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [])
            @Expect("assertion#4512: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [])
            @Expect("assertion#4513: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4514: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [])
            @Expect("assertion#4515: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#4516: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#4517: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#4518: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt64>(), [()])
            @Expect("assertion#4519: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4520: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_145")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4521: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_144 ends.")
    }
}
