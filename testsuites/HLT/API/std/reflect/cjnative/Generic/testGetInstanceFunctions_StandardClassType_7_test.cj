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
class testGetInstanceFunctions_StandardClassType_7 {
    @TestCase
    func TestCase_30(): Unit {
        // logger.info("testcase TestCase_30 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Int64, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_31").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [], [NonGenericStruct()])
            @Expect("assertion#871: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#872: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#873: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#874: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#875: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#876: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#877: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#878: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [], [()])
            @Expect("assertion#879: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#880: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#881: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#882: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#883: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#884: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#885: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Int64, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
            .apply(StandardClassType<UInt8, Int64, UInt16>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#886: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt8, Int64, UInt16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#887: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt8, Int64, UInt16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [])
            @Expect("assertion#888: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [])
            @Expect("assertion#889: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [])
            @Expect("assertion#890: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [])
            @Expect("assertion#891: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [])
            @Expect("assertion#892: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [])
            @Expect("assertion#893: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#894: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#895: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#896: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(StandardClassType<UInt8, Int64, UInt16>(), [()])
            @Expect("assertion#897: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#898: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_31")[0i64]
                .apply("hello", [()])
            @Expect("assertion#899: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_30 ends.")
    }

    @TestCase
    func TestCase_31(): Unit {
        // logger.info("testcase TestCase_31 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Float32, Float64>>().getInstanceFunctions("classInstanceMemberFunction_32").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [], [NonGenericStruct()])
            @Expect("assertion#900: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#901: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#902: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#903: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#904: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#905: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#906: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#907: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [], [()])
            @Expect("assertion#908: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#909: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#910: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#911: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#912: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#913: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#914: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, Float32, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
            .apply(StandardClassType<Int64, Float32, Float64>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#915: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Float32, Float64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#916: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Float32, Float64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [])
            @Expect("assertion#917: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [])
            @Expect("assertion#918: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [])
            @Expect("assertion#919: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [])
            @Expect("assertion#920: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [])
            @Expect("assertion#921: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [])
            @Expect("assertion#922: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#923: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#924: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#925: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(StandardClassType<Int64, Float32, Float64>(), [()])
            @Expect("assertion#926: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#927: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_32")[0i64]
                .apply("hello", [()])
            @Expect("assertion#928: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_31 ends.")
    }

    @TestCase
    func TestCase_32(): Unit {
        // logger.info("testcase TestCase_32 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, Unit, Int8>>().getInstanceFunctions("classInstanceMemberFunction_33").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [], [NonGenericStruct()])
            @Expect("assertion#929: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#930: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#931: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#932: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#933: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#934: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#935: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#936: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [], [()])
            @Expect("assertion#937: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#938: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#939: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#940: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#941: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#942: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#943: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, Unit, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
            .apply(StandardClassType<Float64, Unit, Int8>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#944: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float64, Unit, Int8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#945: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float64, Unit, Int8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [])
            @Expect("assertion#946: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [])
            @Expect("assertion#947: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [])
            @Expect("assertion#948: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [])
            @Expect("assertion#949: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [])
            @Expect("assertion#950: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [])
            @Expect("assertion#951: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#952: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#953: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#954: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(StandardClassType<Float64, Unit, Int8>(), [()])
            @Expect("assertion#955: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#956: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Unit, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_33")[0i64]
                .apply("hello", [()])
            @Expect("assertion#957: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_32 ends.")
    }

    @TestCase
    func TestCase_33(): Unit {
        // logger.info("testcase TestCase_33 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Int16, Int32>>().getInstanceFunctions("classInstanceMemberFunction_34").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [], [NonGenericStruct()])
            @Expect("assertion#958: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#959: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#960: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#961: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#962: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#963: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#964: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#965: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [], [()])
            @Expect("assertion#966: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#967: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#968: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#969: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#970: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#971: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#972: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Int16, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
            .apply(StandardClassType<Float32, Int16, Int32>(), [NonGenericStruct()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#973: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float32, Int16, Int32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#974: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float32, Int16, Int32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [])
            @Expect("assertion#975: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [])
            @Expect("assertion#976: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [])
            @Expect("assertion#977: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [])
            @Expect("assertion#978: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [])
            @Expect("assertion#979: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [])
            @Expect("assertion#980: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#981: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#982: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#983: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(StandardClassType<Float32, Int16, Int32>(), [()])
            @Expect("assertion#984: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#985: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_34")[0i64]
                .apply("hello", [()])
            @Expect("assertion#986: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_33 ends.")
    }

    @TestCase
    func TestCase_34(): Unit {
        // logger.info("testcase TestCase_34 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, UInt16, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_35").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(StandardClassType<Bool, UInt16, UInt8>(), [], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#987: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#988: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#989: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(StandardClassType<Bool, UInt16, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#990: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#991: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#992: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(StandardClassType<Bool, UInt16, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#993: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(StandardClassType<Bool, UInt16, UInt8>(), [],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#994: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(StandardClassType<Bool, UInt16, UInt8>(), [], [()])
            @Expect("assertion#995: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#996: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#997: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#998: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#999: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1000: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1001: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, UInt16, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
            .apply(StandardClassType<Bool, UInt16, UInt8>(), [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#1002: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, UInt16, UInt8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#1003: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, UInt16, UInt8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(StandardClassType<Bool, UInt16, UInt8>(), [])
            @Expect("assertion#1004: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1005: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply("hello", [])
            @Expect("assertion#1006: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(StandardClassType<Bool, UInt16, UInt8>(), [])
            @Expect("assertion#1007: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1008: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply("hello", [])
            @Expect("assertion#1009: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(StandardClassType<Bool, UInt16, UInt8>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1010: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1011: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1012: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(StandardClassType<Bool, UInt16, UInt8>(), [()])
            @Expect("assertion#1013: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1014: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_35")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1015: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_34 ends.")
    }
}
