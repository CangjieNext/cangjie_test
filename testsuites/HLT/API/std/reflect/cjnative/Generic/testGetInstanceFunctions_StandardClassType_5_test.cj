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
class testGetInstanceFunctions_StandardClassType_5 {
    @TestCase
    func TestCase_20(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Int64, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_21").size)
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#581: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#582: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#583: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#584: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#585: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#586: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#587: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#588: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [], [()])
            @Expect("assertion#589: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#590: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#591: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#592: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#593: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#594: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#595: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Float32, Int64, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
            .apply(StandardClassType<Float32, Int64, UInt64>(), [GenericClassWith1TypeParameters<Int64>()])
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#596: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float32, Int64, UInt64>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#597: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float32, Int64, UInt64>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [])
            @Expect("assertion#598: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [])
            @Expect("assertion#599: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [])
            @Expect("assertion#600: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [])
            @Expect("assertion#601: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [])
            @Expect("assertion#602: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [])
            @Expect("assertion#603: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#604: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#605: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#606: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(StandardClassType<Float32, Int64, UInt64>(), [()])
            @Expect("assertion#607: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#608: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_21")[0i64]
                .apply("hello", [()])
            @Expect("assertion#609: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_21(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, UInt32, Float64>>().getInstanceFunctions("classInstanceMemberFunction_22").size)
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [], [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#610: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#611: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#612: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#613: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#614: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#615: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#616: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#617: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [], [()])
            @Expect("assertion#618: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#619: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#620: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#621: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#622: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#623: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#624: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<UInt64, UInt32, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
            .apply(StandardClassType<UInt64, UInt32, Float64>(), [GenericClassWith1TypeParameters<Float64>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#625: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, UInt32, Float64>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#626: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, UInt32, Float64>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [])
            @Expect("assertion#627: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [])
            @Expect("assertion#628: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [])
            @Expect("assertion#629: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [])
            @Expect("assertion#630: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [])
            @Expect("assertion#631: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [])
            @Expect("assertion#632: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(),
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#633: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#634: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#635: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [()])
            @Expect("assertion#636: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#637: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_22")[0i64]
                .apply("hello", [()])
            @Expect("assertion#638: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_22(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, Int64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_23").size)
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#639: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#640: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#641: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#642: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#643: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#644: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#645: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#646: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [], [()])
            @Expect("assertion#647: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#648: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#649: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#650: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#651: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#652: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#653: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Float64, Int64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
            .apply(StandardClassType<Float64, Int64, Float32>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#654: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float64, Int64, Float32>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#655: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Float64, Int64, Float32>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [])
            @Expect("assertion#656: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [])
            @Expect("assertion#657: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [])
            @Expect("assertion#658: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [])
            @Expect("assertion#659: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [])
            @Expect("assertion#660: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [])
            @Expect("assertion#661: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#662: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#663: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#664: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(StandardClassType<Float64, Int64, Float32>(), [()])
            @Expect("assertion#665: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#666: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_23")[0i64]
                .apply("hello", [()])
            @Expect("assertion#667: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_23(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int16, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_24").size)
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#668: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#669: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#670: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#671: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#672: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#673: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#674: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
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
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [], [()])
            @Expect("assertion#676: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#677: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#678: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#679: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#680: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#681: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#682: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Int16, Int16, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
            .apply(StandardClassType<Int16, Int16, UInt16>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#683: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int16, Int16, UInt16>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#684: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int16, Int16, UInt16>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [])
            @Expect("assertion#685: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [])
            @Expect("assertion#686: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [])
            @Expect("assertion#687: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [])
            @Expect("assertion#688: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [])
            @Expect("assertion#689: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [])
            @Expect("assertion#690: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
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
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#692: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#693: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(StandardClassType<Int16, Int16, UInt16>(), [()])
            @Expect("assertion#694: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#695: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_24")[0i64]
                .apply("hello", [()])
            @Expect("assertion#696: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_24(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Float32, Bool>>().getInstanceFunctions("classInstanceMemberFunction_25").size)
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#697: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#698: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#699: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#700: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#701: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#702: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#703: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#704: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [], [()])
            @Expect("assertion#705: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#706: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#707: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#708: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#709: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#710: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#711: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Int32, Float32, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
            .apply(StandardClassType<Int32, Float32, Bool>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#712: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Float32, Bool>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#713: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Float32, Bool>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [])
            @Expect("assertion#714: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [])
            @Expect("assertion#715: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [])
            @Expect("assertion#716: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [])
            @Expect("assertion#717: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [])
            @Expect("assertion#718: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [])
            @Expect("assertion#719: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#720: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#721: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#722: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(StandardClassType<Int32, Float32, Bool>(), [()])
            @Expect("assertion#723: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#724: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Float32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_25")[0i64]
                .apply("hello", [()])
            @Expect("assertion#725: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }
}
