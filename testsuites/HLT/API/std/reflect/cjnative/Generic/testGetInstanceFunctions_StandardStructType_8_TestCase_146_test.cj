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
    func TestCase_146(): Unit {
        // logger.info("testcase TestCase_146 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, UInt16, Bool>>().getInstanceFunctions("classInstanceMemberFunction_147").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4551: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4552: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4553: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4554: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4555: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4556: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4557: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4558: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [], [()])
            @Expect("assertion#4559: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4560: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4561: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4562: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4563: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4564: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4565: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, UInt16, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
            .apply(StandardStructType<Int64, UInt16, Bool>(), [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4566: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, UInt16, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4567: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, UInt16, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [])
            @Expect("assertion#4568: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4569: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [])
            @Expect("assertion#4570: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [])
            @Expect("assertion#4571: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4572: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [])
            @Expect("assertion#4573: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4574: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4575: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4576: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [()])
            @Expect("assertion#4577: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4578: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_147")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4579: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_146 ends.")
    }
}
