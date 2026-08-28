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
class testGetInstanceFunctions_StandardStructType_4 {
    @TestCase
    func TestCase_126(): Unit {
        // logger.info("testcase TestCase_126 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Unit, Int16>>().getInstanceFunctions("classInstanceMemberFunction_127").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#3971: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#3972: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3973: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3974: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3975: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3976: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3977: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3978: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [], [()])
            @Expect("assertion#3979: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3980: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#3981: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3982: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3983: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3984: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3985: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Unit, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
            .apply(StandardStructType<UInt16, Unit, Int16>(), [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#3986: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, Unit, Int16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#3987: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, Unit, Int16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [])
            @Expect("assertion#3988: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3989: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [])
            @Expect("assertion#3990: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [])
            @Expect("assertion#3991: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3992: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [])
            @Expect("assertion#3993: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3994: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3995: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3996: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [()])
            @Expect("assertion#3997: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3998: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3999: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_126 ends.")
    }
}
