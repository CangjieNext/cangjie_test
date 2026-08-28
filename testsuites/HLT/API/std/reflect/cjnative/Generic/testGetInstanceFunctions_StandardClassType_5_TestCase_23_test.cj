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
class testGetInstanceFunctions_StandardClassType_5 {
    @TestCase
    func TestCase_23(): Unit {
        // logger.info("testcase TestCase_23 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int16, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_24").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#668: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#669: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#670: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#671: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#672: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#673: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#674: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#675: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [], [()])
            @Expect("assertion#676: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#677: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#678: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#679: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#680: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#681: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#682: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Int16, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
            .apply(StandardClassType<Int16, Int16, UInt16>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#683: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int16, Int16, UInt16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#684: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int16, Int16, UInt16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [])
            @Expect("assertion#685: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [])
            @Expect("assertion#686: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [])
            @Expect("assertion#687: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [])
            @Expect("assertion#688: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [])
            @Expect("assertion#689: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [])
            @Expect("assertion#690: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#691: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#692: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#693: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [()])
            @Expect("assertion#694: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#695: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [()])
            @Expect("assertion#696: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_23 ends.")
    }
}
