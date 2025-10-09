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
class testGetInstanceFunctions_StandardStructType_10 {
    @TestCase
    func TestCase_154(): Unit {
        // logger.info("testcase TestCase_154 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, UInt64, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_155").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#4783: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#4784: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4785: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4786: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4787: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#4788: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4789: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#4790: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [], [()])
            @Expect("assertion#4791: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4792: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#4793: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4794: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4795: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#4796: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4797: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, UInt64, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
            .apply(StandardStructType<UInt16, UInt64, UInt32>(), [GenericStructWith2TypeParameters<UInt32, UInt32>()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#4798: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, UInt64, UInt32>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#4799: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, UInt64, UInt32>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [])
            @Expect("assertion#4800: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4801: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [])
            @Expect("assertion#4802: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [])
            @Expect("assertion#4803: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4804: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [])
            @Expect("assertion#4805: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(),
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#4806: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#4807: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#4808: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(StandardStructType<UInt16, UInt64, UInt32>(), [()])
            @Expect("assertion#4809: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4810: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_155")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4811: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_154 ends.")
    }

    @TestCase
    func TestCase_155(): Unit {
        // logger.info("testcase TestCase_155 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Float32, Int16>>().getInstanceFunctions("classInstanceMemberFunction_156").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Float32, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
            .apply(StandardStructType<UInt32, Float32, Int16>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [123i64])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [123i64])
            @Expect("assertion#4812: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [123i64])
            @Expect("assertion#4813: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#4814: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#4815: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#4816: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#4817: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#4818: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#4819: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [123i64, 114.514000f64])
            @Expect("assertion#4820: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [123i64, 114.514000f64])
            @Expect("assertion#4821: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#4822: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#4823: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#4824: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [114.514000f64])
            @Expect("assertion#4825: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#4826: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#4827: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#4828: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [123i64, 114.514000f64])
            @Expect("assertion#4829: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#4830: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [123i64])
            @Expect("assertion#4831: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#4832: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#4833: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [])
            @Expect("assertion#4834: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4835: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [])
            @Expect("assertion#4836: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [])
            @Expect("assertion#4837: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4838: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [])
            @Expect("assertion#4839: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [123i64, 114.514000f64])
            @Expect("assertion#4840: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#4841: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#4842: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int16>(), [114.514000f64])
            @Expect("assertion#4843: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#4844: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_156")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#4845: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_155 ends.")
    }

    @TestCase
    func TestCase_156(): Unit {
        // logger.info("testcase TestCase_156 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_157").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, UInt64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
            .apply(StandardStructType<Bool, UInt64, Float32>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [true])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [true])
            @Expect("assertion#4846: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [true])
            @Expect("assertion#4847: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#4848: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(StandardStructType<Bool, UInt64, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#4849: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#4850: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#4851: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(StandardStructType<Bool, UInt64, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#4852: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#4853: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [true, 114.514000f64])
            @Expect("assertion#4854: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [true, 114.514000f64])
            @Expect("assertion#4855: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(StandardStructType<Bool, UInt64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [true, 114.514000f64])
            @Expect("assertion#4856: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(StandardStructType<Bool, UInt64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#4857: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#4858: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#4859: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(StandardStructType<Bool, UInt64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [true])
            @Expect("assertion#4860: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(StandardStructType<Bool, UInt64, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#4861: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(StandardStructType<Bool, UInt64, Float32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#4862: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(StandardStructType<Bool, UInt64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [true, 114.514000f64])
            @Expect("assertion#4863: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(StandardStructType<Bool, UInt64, Float32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#4864: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(StandardStructType<Bool, UInt64, Float32>(), [true])
            @Expect("assertion#4865: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(1i64, [true])
            @Expect("assertion#4866: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply("hello", [true])
            @Expect("assertion#4867: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(StandardStructType<Bool, UInt64, Float32>(), [])
            @Expect("assertion#4868: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4869: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply("hello", [])
            @Expect("assertion#4870: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(StandardStructType<Bool, UInt64, Float32>(), [])
            @Expect("assertion#4871: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4872: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply("hello", [])
            @Expect("assertion#4873: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(StandardStructType<Bool, UInt64, Float32>(), [true, 114.514000f64])
            @Expect("assertion#4874: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(1i64, [true, 114.514000f64])
            @Expect("assertion#4875: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply("hello", [true, 114.514000f64])
            @Expect("assertion#4876: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(StandardStructType<Bool, UInt64, Float32>(), [()])
            @Expect("assertion#4877: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4878: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_157")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4879: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_156 ends.")
    }

    @TestCase
    func TestCase_157(): Unit {
        // logger.info("testcase TestCase_157 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt64, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_158").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt64, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
            .apply(StandardStructType<Unit, UInt64, UInt8>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#4880: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#4881: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4882: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4883: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#4884: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4885: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#4886: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#4887: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [(), 114.514000f64])
            @Expect("assertion#4888: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [(), 114.514000f64])
            @Expect("assertion#4889: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [(), 114.514000f64])
            @Expect("assertion#4890: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [123i64])
            @Expect("assertion#4891: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [123i64])
            @Expect("assertion#4892: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [123i64])
            @Expect("assertion#4893: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#4894: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#4895: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4896: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [(), 114.514000f64])
            @Expect("assertion#4897: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#4898: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [()])
            @Expect("assertion#4899: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4900: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4901: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [])
            @Expect("assertion#4902: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4903: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [])
            @Expect("assertion#4904: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [])
            @Expect("assertion#4905: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4906: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [])
            @Expect("assertion#4907: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [(), 114.514000f64])
            @Expect("assertion#4908: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [(), 114.514000f64])
            @Expect("assertion#4909: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [(), 114.514000f64])
            @Expect("assertion#4910: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [123i64])
            @Expect("assertion#4911: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#4912: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#4913: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_157 ends.")
    }

    @TestCase
    func TestCase_158(): Unit {
        // logger.info("testcase TestCase_158 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int64, Int64>>().getInstanceFunctions("classInstanceMemberFunction_159").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Int64, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
            .apply(StandardStructType<Int64, Int64, Int64>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [123i64])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [123i64])
            @Expect("assertion#4914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [123i64])
            @Expect("assertion#4915: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4916: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4917: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#4918: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4919: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#4920: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#4921: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [123i64, 114.514000f64])
            @Expect("assertion#4922: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [123i64, 114.514000f64])
            @Expect("assertion#4923: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#4924: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#4925: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#4926: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#4927: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#4928: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#4929: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4930: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [123i64, 114.514000f64])
            @Expect("assertion#4931: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#4932: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [123i64])
            @Expect("assertion#4933: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#4934: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#4935: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [])
            @Expect("assertion#4936: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4937: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [])
            @Expect("assertion#4938: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [])
            @Expect("assertion#4939: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4940: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [])
            @Expect("assertion#4941: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#4942: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#4943: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#4944: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(StandardStructType<Int64, Int64, Int64>(), [114.514000f64])
            @Expect("assertion#4945: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#4946: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_159")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#4947: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_158 ends.")
    }
}
