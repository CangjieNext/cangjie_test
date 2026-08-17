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
    func TestCase_148(): Unit {
        // logger.info("testcase TestCase_148 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Int8, Int64>>().getInstanceFunctions("classInstanceMemberFunction_149").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4609: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4610: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4611: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4612: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4613: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4614: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4615: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4616: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [], [()])
            @Expect("assertion#4617: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4618: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4619: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4620: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4621: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4622: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4623: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Int8, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
            .apply(StandardStructType<UInt32, Int8, Int64>(), [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4624: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt32, Int8, Int64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4625: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt32, Int8, Int64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [])
            @Expect("assertion#4626: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4627: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [])
            @Expect("assertion#4628: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [])
            @Expect("assertion#4629: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4630: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [])
            @Expect("assertion#4631: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4632: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4633: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4634: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(StandardStructType<UInt32, Int8, Int64>(), [()])
            @Expect("assertion#4635: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4636: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Int8, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_149")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4637: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_148 ends.")
    }
}
