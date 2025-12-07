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
class testGetInstanceFunctions_StandardClassType_3 {
    @TestCase
    func TestCase_10(): Unit {
        // logger.info("testcase TestCase_10 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, UInt16, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_11").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [], [NonGenericClass()])
            @Expect("assertion#291: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#292: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#293: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#294: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#295: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#296: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#297: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#298: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [], [()])
            @Expect("assertion#299: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#300: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#301: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#302: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#303: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#304: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#305: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, UInt16, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
            .apply(StandardClassType<Unit, UInt16, UInt64>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#306: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Unit, UInt16, UInt64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#307: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Unit, UInt16, UInt64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [])
            @Expect("assertion#308: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [])
            @Expect("assertion#309: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [])
            @Expect("assertion#310: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [])
            @Expect("assertion#311: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [])
            @Expect("assertion#312: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [])
            @Expect("assertion#313: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#314: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#315: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#316: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt64>(), [()])
            @Expect("assertion#317: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#318: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_11")[0i64]
                .apply("hello", [()])
            @Expect("assertion#319: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_10 ends.")
    }

    @TestCase
    func TestCase_11(): Unit {
        // logger.info("testcase TestCase_11 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, Float32, Unit>>().getInstanceFunctions("classInstanceMemberFunction_12").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [], [NonGenericClass()])
            @Expect("assertion#320: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#321: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#322: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#323: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#324: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#325: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#326: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#327: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [], [()])
            @Expect("assertion#328: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#329: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#330: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#331: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#332: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#333: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#334: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, Float32, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
            .apply(StandardClassType<Int8, Float32, Unit>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#335: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int8, Float32, Unit>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#336: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int8, Float32, Unit>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [])
            @Expect("assertion#337: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [])
            @Expect("assertion#338: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [])
            @Expect("assertion#339: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [])
            @Expect("assertion#340: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [])
            @Expect("assertion#341: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [])
            @Expect("assertion#342: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#343: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#344: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#345: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(StandardClassType<Int8, Float32, Unit>(), [()])
            @Expect("assertion#346: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#347: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_12")[0i64]
                .apply("hello", [()])
            @Expect("assertion#348: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_11 ends.")
    }

    @TestCase
    func TestCase_12(): Unit {
        // logger.info("testcase TestCase_12 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Float64, Int32>>().getInstanceFunctions("classInstanceMemberFunction_13").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [], [NonGenericClass()])
            @Expect("assertion#349: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#350: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#351: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#352: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#353: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#354: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#355: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#356: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [], [()])
            @Expect("assertion#357: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#358: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#359: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#360: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#361: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#362: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#363: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Float64, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
            .apply(StandardClassType<Int32, Float64, Int32>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#364: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Float64, Int32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#365: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Float64, Int32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [])
            @Expect("assertion#366: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [])
            @Expect("assertion#367: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [])
            @Expect("assertion#368: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [])
            @Expect("assertion#369: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [])
            @Expect("assertion#370: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [])
            @Expect("assertion#371: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#372: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#373: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#374: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(StandardClassType<Int32, Float64, Int32>(), [()])
            @Expect("assertion#375: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#376: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float64, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_13")[0i64]
                .apply("hello", [()])
            @Expect("assertion#377: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_12 ends.")
    }

    @TestCase
    func TestCase_13(): Unit {
        // logger.info("testcase TestCase_13 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Unit, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_14").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(StandardClassType<Bool, Unit, UInt16>(), [], [NonGenericClass()])
            @Expect("assertion#378: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#379: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#380: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(StandardClassType<Bool, Unit, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#381: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#382: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#383: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(StandardClassType<Bool, Unit, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#384: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(StandardClassType<Bool, Unit, UInt16>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#385: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(StandardClassType<Bool, Unit, UInt16>(), [], [()])
            @Expect("assertion#386: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#387: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#388: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#389: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#390: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#391: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#392: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, Unit, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
            .apply(StandardClassType<Bool, Unit, UInt16>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#393: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Unit, UInt16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#394: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Unit, UInt16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(StandardClassType<Bool, Unit, UInt16>(), [])
            @Expect("assertion#395: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(1i64, [])
            @Expect("assertion#396: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply("hello", [])
            @Expect("assertion#397: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(StandardClassType<Bool, Unit, UInt16>(), [])
            @Expect("assertion#398: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(1i64, [])
            @Expect("assertion#399: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply("hello", [])
            @Expect("assertion#400: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(StandardClassType<Bool, Unit, UInt16>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#401: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#402: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#403: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(StandardClassType<Bool, Unit, UInt16>(), [()])
            @Expect("assertion#404: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#405: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_14")[0i64]
                .apply("hello", [()])
            @Expect("assertion#406: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_13 ends.")
    }

    @TestCase
    func TestCase_14(): Unit {
        // logger.info("testcase TestCase_14 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Int32, Int16>>().getInstanceFunctions("classInstanceMemberFunction_15").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(StandardClassType<UInt16, Int32, Int16>(), [], [NonGenericClass()])
            @Expect("assertion#407: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#408: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#409: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(StandardClassType<UInt16, Int32, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#410: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#411: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#412: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(StandardClassType<UInt16, Int32, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#413: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(StandardClassType<UInt16, Int32, Int16>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#414: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(StandardClassType<UInt16, Int32, Int16>(), [], [()])
            @Expect("assertion#415: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#416: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#417: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#418: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#419: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#420: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#421: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, Int32, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
            .apply(StandardClassType<UInt16, Int32, Int16>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#422: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt16, Int32, Int16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#423: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt16, Int32, Int16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(StandardClassType<UInt16, Int32, Int16>(), [])
            @Expect("assertion#424: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(1i64, [])
            @Expect("assertion#425: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply("hello", [])
            @Expect("assertion#426: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(StandardClassType<UInt16, Int32, Int16>(), [])
            @Expect("assertion#427: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(1i64, [])
            @Expect("assertion#428: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply("hello", [])
            @Expect("assertion#429: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(StandardClassType<UInt16, Int32, Int16>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#430: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#431: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#432: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(StandardClassType<UInt16, Int32, Int16>(), [()])
            @Expect("assertion#433: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#434: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_15")[0i64]
                .apply("hello", [()])
            @Expect("assertion#435: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_14 ends.")
    }
}
