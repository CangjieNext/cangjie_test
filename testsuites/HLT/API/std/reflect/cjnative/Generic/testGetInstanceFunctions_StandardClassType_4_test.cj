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
class testGetInstanceFunctions_StandardClassType_4 {
    @TestCase
    func TestCase_15(): Unit {
        // logger.info("testcase TestCase_15 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, UInt16, Float32>>().getInstanceFunctions("classInstanceMemberFunction_16").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [], [NonGenericClass()])
            @Expect("assertion#436: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#437: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#438: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#439: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#440: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#441: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#442: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#443: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [], [()])
            @Expect("assertion#444: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#445: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#446: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#447: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#448: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#449: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#450: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, UInt16, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
            .apply(StandardClassType<Unit, UInt16, Float32>(), [NonGenericClass()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#451: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Unit, UInt16, Float32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#452: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Unit, UInt16, Float32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [])
            @Expect("assertion#453: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [])
            @Expect("assertion#454: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [])
            @Expect("assertion#455: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [])
            @Expect("assertion#456: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [])
            @Expect("assertion#457: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [])
            @Expect("assertion#458: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#459: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#460: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#461: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(StandardClassType<Unit, UInt16, Float32>(), [()])
            @Expect("assertion#462: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#463: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_16")[0i64]
                .apply("hello", [()])
            @Expect("assertion#464: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_15 ends.")
    }

    @TestCase
    func TestCase_16(): Unit {
        // logger.info("testcase TestCase_16 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>().getInstanceFunctions("classInstanceMemberFunction_17").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#465: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#466: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#467: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#468: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#469: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#470: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#471: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#472: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [], [()])
            @Expect("assertion#473: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#474: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#475: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#476: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#477: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#478: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#479: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, UInt32, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
            .apply(StandardClassType<Int64, UInt32, Float64>(), [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#480: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, UInt32, Float64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#481: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, UInt32, Float64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [])
            @Expect("assertion#482: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [])
            @Expect("assertion#483: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [])
            @Expect("assertion#484: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [])
            @Expect("assertion#485: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [])
            @Expect("assertion#486: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [])
            @Expect("assertion#487: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#488: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#489: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#490: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(StandardClassType<Int64, UInt32, Float64>(), [()])
            @Expect("assertion#491: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#492: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_17")[0i64]
                .apply("hello", [()])
            @Expect("assertion#493: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_16 ends.")
    }

    @TestCase
    func TestCase_17(): Unit {
        // logger.info("testcase TestCase_17 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Float64, Bool>>().getInstanceFunctions("classInstanceMemberFunction_18").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#494: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#495: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#496: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#497: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#498: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#499: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#500: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#501: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [], [()])
            @Expect("assertion#502: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#503: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#504: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#505: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#506: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#507: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#508: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Float64, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
            .apply(StandardClassType<UInt8, Float64, Bool>(), [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#509: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt8, Float64, Bool>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#510: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt8, Float64, Bool>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [])
            @Expect("assertion#511: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [])
            @Expect("assertion#512: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [])
            @Expect("assertion#513: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [])
            @Expect("assertion#514: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [])
            @Expect("assertion#515: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [])
            @Expect("assertion#516: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#517: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#518: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#519: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(StandardClassType<UInt8, Float64, Bool>(), [()])
            @Expect("assertion#520: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#521: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_18")[0i64]
                .apply("hello", [()])
            @Expect("assertion#522: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_17 ends.")
    }

    @TestCase
    func TestCase_18(): Unit {
        // logger.info("testcase TestCase_18 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, UInt16, Int8>>().getInstanceFunctions("classInstanceMemberFunction_19").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(StandardClassType<Bool, UInt16, Int8>(), [], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#523: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#524: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#525: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(StandardClassType<Bool, UInt16, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#526: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#527: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#528: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(StandardClassType<Bool, UInt16, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#529: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(StandardClassType<Bool, UInt16, Int8>(), [],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#530: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(StandardClassType<Bool, UInt16, Int8>(), [], [()])
            @Expect("assertion#531: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#532: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#533: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#534: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#535: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#536: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#537: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, UInt16, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
            .apply(StandardClassType<Bool, UInt16, Int8>(), [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#538: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, UInt16, Int8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#539: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, UInt16, Int8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(StandardClassType<Bool, UInt16, Int8>(), [])
            @Expect("assertion#540: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(1i64, [])
            @Expect("assertion#541: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply("hello", [])
            @Expect("assertion#542: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(StandardClassType<Bool, UInt16, Int8>(), [])
            @Expect("assertion#543: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(1i64, [])
            @Expect("assertion#544: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply("hello", [])
            @Expect("assertion#545: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(StandardClassType<Bool, UInt16, Int8>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#546: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#547: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#548: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(StandardClassType<Bool, UInt16, Int8>(), [()])
            @Expect("assertion#549: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#550: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_19")[0i64]
                .apply("hello", [()])
            @Expect("assertion#551: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_18 ends.")
    }

    @TestCase
    func TestCase_19(): Unit {
        // logger.info("testcase TestCase_19 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Int32, Float64>>().getInstanceFunctions("classInstanceMemberFunction_20").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#552: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#553: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#554: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#555: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#556: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#557: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#558: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#559: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [], [()])
            @Expect("assertion#560: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#561: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#562: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#563: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#564: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#565: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#566: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, Int32, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
            .apply(StandardClassType<Bool, Int32, Float64>(), [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#567: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int32, Float64>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#568: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int32, Float64>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [])
            @Expect("assertion#569: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [])
            @Expect("assertion#570: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [])
            @Expect("assertion#571: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [])
            @Expect("assertion#572: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [])
            @Expect("assertion#573: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [])
            @Expect("assertion#574: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#575: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#576: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#577: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(StandardClassType<Bool, Int32, Float64>(), [()])
            @Expect("assertion#578: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#579: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_20")[0i64]
                .apply("hello", [()])
            @Expect("assertion#580: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_19 ends.")
    }
}
