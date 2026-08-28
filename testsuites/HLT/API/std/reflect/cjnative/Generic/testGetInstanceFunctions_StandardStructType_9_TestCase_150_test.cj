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
    func TestCase_150(): Unit {
        // logger.info("testcase TestCase_150 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt64, Bool>>().getInstanceFunctions("classInstanceMemberFunction_151").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4667: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4668: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4669: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4670: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4671: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4672: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4673: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4674: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [], [()])
            @Expect("assertion#4675: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4676: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4677: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4678: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4679: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4680: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4681: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt64, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
            .apply(StandardStructType<Unit, UInt64, Bool>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4682: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Unit, UInt64, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4683: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Unit, UInt64, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [])
            @Expect("assertion#4684: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4685: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [])
            @Expect("assertion#4686: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [])
            @Expect("assertion#4687: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4688: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [])
            @Expect("assertion#4689: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4690: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4691: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4692: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [()])
            @Expect("assertion#4693: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4694: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4695: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_150 ends.")
    }
}
