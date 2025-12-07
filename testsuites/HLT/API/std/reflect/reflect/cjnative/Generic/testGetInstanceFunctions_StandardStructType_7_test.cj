/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// (not MAC) EXEC: cd dependency && %compiler %cmp_opt --output-type=dylib  *.cj -o libdependency.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output --import-path . -L dependency -ldependency
// (not MAC) RUN-EXEC: %cp ./dependency/libdependency.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args  
package testsuite

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*

@Test
class testGetInstanceFunctions_StandardStructType_7 {
    @TestCase
    func TestCase_139(): Unit {
        // logger.info("testcase TestCase_139 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_140").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [], [NonGenericStruct()])
            @Expect("assertion#4348: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#4349: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4350: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4351: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4352: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4353: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4354: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4355: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [], [()])
            @Expect("assertion#4356: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4357: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#4358: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4359: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4360: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4361: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4362: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Int32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
            .apply(StandardStructType<Int32, Int32, Int8>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#4363: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int32, Int8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#4364: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int32, Int8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [])
            @Expect("assertion#4365: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4366: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [])
            @Expect("assertion#4367: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [])
            @Expect("assertion#4368: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4369: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [])
            @Expect("assertion#4370: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4371: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4372: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4373: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [()])
            @Expect("assertion#4374: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4375: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_140")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4376: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_139 ends.")
    }

    @TestCase
    func TestCase_140(): Unit {
        // logger.info("testcase TestCase_140 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_141").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [], [NonGenericStruct()])
            @Expect("assertion#4377: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#4378: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4379: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4380: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4381: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4382: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4383: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4384: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [], [()])
            @Expect("assertion#4385: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4386: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#4387: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4388: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4389: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4390: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4391: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Int32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
            .apply(StandardStructType<Int32, Int32, Int8>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#4392: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int32, Int8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#4393: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int32, Int8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [])
            @Expect("assertion#4394: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4395: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [])
            @Expect("assertion#4396: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [])
            @Expect("assertion#4397: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4398: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [])
            @Expect("assertion#4399: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4400: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4401: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4402: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(StandardStructType<Int32, Int32, Int8>(), [()])
            @Expect("assertion#4403: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4404: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_141")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4405: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_140 ends.")
    }

    @TestCase
    func TestCase_141(): Unit {
        // logger.info("testcase TestCase_141 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, UInt8, Int16>>().getInstanceFunctions("classInstanceMemberFunction_142").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [], [NonGenericStruct()])
            @Expect("assertion#4406: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#4407: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4408: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4409: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4410: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4411: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4412: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4413: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [], [()])
            @Expect("assertion#4414: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4415: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#4416: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4417: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4418: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4419: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4420: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, UInt8, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
            .apply(StandardStructType<Float64, UInt8, Int16>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#4421: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, UInt8, Int16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#4422: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, UInt8, Int16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [])
            @Expect("assertion#4423: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4424: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [])
            @Expect("assertion#4425: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [])
            @Expect("assertion#4426: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4427: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [])
            @Expect("assertion#4428: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4429: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4430: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4431: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int16>(), [()])
            @Expect("assertion#4432: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4433: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_142")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4434: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_141 ends.")
    }

    @TestCase
    func TestCase_142(): Unit {
        // logger.info("testcase TestCase_142 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int16, Bool>>().getInstanceFunctions("classInstanceMemberFunction_143").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [], [NonGenericStruct()])
            @Expect("assertion#4435: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#4436: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4437: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4438: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4439: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4440: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4441: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4442: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [], [()])
            @Expect("assertion#4443: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4444: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#4445: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4446: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4447: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4448: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4449: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Int16, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
            .apply(StandardStructType<Bool, Int16, Bool>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#4450: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Bool, Int16, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#4451: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Bool, Int16, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [])
            @Expect("assertion#4452: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4453: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [])
            @Expect("assertion#4454: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [])
            @Expect("assertion#4455: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4456: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [])
            @Expect("assertion#4457: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4458: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4459: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4460: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(StandardStructType<Bool, Int16, Bool>(), [()])
            @Expect("assertion#4461: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4462: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_143")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4463: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_142 ends.")
    }

    @TestCase
    func TestCase_143(): Unit {
        // logger.info("testcase TestCase_143 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Float64, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_144").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4464: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4465: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4466: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4467: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4468: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4469: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4470: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4471: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [], [()])
            @Expect("assertion#4472: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4473: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4474: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4475: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4476: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4477: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4478: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Float64, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
            .apply(StandardStructType<UInt32, Float64, UInt32>(), [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4479: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt32, Float64, UInt32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#4480: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt32, Float64, UInt32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [])
            @Expect("assertion#4481: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4482: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [])
            @Expect("assertion#4483: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [])
            @Expect("assertion#4484: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4485: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [])
            @Expect("assertion#4486: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4487: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4488: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#4489: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(StandardStructType<UInt32, Float64, UInt32>(), [()])
            @Expect("assertion#4490: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4491: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_144")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4492: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_143 ends.")
    }
}
