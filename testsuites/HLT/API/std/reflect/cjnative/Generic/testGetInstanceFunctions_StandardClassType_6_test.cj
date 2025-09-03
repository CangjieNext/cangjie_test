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
class testGetInstanceFunctions_StandardClassType_6 {
    @TestCase
    func TestCase_25(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, UInt16, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_26").size)
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#726: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#727: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#728: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#729: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#730: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#731: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#732: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#733: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [], [()])
            @Expect("assertion#734: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#735: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#736: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#737: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#738: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#739: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#740: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Unit, UInt16, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
            .apply(StandardClassType<Unit, UInt16, UInt16>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#741: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Unit, UInt16, UInt16>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#742: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Unit, UInt16, UInt16>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [])
            @Expect("assertion#743: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [])
            @Expect("assertion#744: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [])
            @Expect("assertion#745: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [])
            @Expect("assertion#746: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [])
            @Expect("assertion#747: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [])
            @Expect("assertion#748: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#749: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#750: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#751: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(StandardClassType<Unit, UInt16, UInt16>(), [()])
            @Expect("assertion#752: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#753: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_26")[0i64]
                .apply("hello", [()])
            @Expect("assertion#754: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_26(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Int8, Int16>>().getInstanceFunctions("classInstanceMemberFunction_27").size)
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [], [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#755: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#756: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#757: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#758: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#759: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#760: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#761: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#762: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [], [()])
            @Expect("assertion#763: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#764: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#765: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#766: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#767: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#768: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#769: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Int32, Int8, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
            .apply(StandardClassType<Int32, Int8, Int16>(), [GenericClassWith2TypeParameters<Int8, Int8>()])
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#770: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Int8, Int16>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#771: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Int8, Int16>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [])
            @Expect("assertion#772: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [])
            @Expect("assertion#773: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [])
            @Expect("assertion#774: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [])
            @Expect("assertion#775: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [])
            @Expect("assertion#776: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [])
            @Expect("assertion#777: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(),
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#778: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#779: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#780: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(StandardClassType<Int32, Int8, Int16>(), [()])
            @Expect("assertion#781: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#782: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_27")[0i64]
                .apply("hello", [()])
            @Expect("assertion#783: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_27(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Int32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_28").size)
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [], [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#784: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#785: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#786: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#787: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#788: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#789: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#790: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#791: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [], [()])
            @Expect("assertion#792: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#793: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#794: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#795: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#796: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#797: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#798: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Bool, Int32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
            .apply(StandardClassType<Bool, Int32, Int8>(), [GenericClassWith2TypeParameters<Int8, Int8>()])
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#799: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int32, Int8>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#800: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int32, Int8>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [])
            @Expect("assertion#801: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [])
            @Expect("assertion#802: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [])
            @Expect("assertion#803: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [])
            @Expect("assertion#804: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [])
            @Expect("assertion#805: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [])
            @Expect("assertion#806: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(),
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#807: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#808: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#809: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(StandardClassType<Bool, Int32, Int8>(), [()])
            @Expect("assertion#810: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#811: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_28")[0i64]
                .apply("hello", [()])
            @Expect("assertion#812: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_28(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Int8, Float32>>().getInstanceFunctions("classInstanceMemberFunction_29").size)
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(StandardClassType<Int32, Int8, Float32>(), [], [NonGenericStruct()])
            @Expect("assertion#813: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#814: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#815: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(StandardClassType<Int32, Int8, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#816: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#817: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#818: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(StandardClassType<Int32, Int8, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#819: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(StandardClassType<Int32, Int8, Float32>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#820: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(StandardClassType<Int32, Int8, Float32>(), [], [()])
            @Expect("assertion#821: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#822: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#823: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#824: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#825: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#826: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#827: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Int32, Int8, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
            .apply(StandardClassType<Int32, Int8, Float32>(), [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#828: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Int8, Float32>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#829: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int32, Int8, Float32>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(StandardClassType<Int32, Int8, Float32>(), [])
            @Expect("assertion#830: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(1i64, [])
            @Expect("assertion#831: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply("hello", [])
            @Expect("assertion#832: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(StandardClassType<Int32, Int8, Float32>(), [])
            @Expect("assertion#833: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(1i64, [])
            @Expect("assertion#834: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply("hello", [])
            @Expect("assertion#835: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(StandardClassType<Int32, Int8, Float32>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#836: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#837: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#838: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(StandardClassType<Int32, Int8, Float32>(), [()])
            @Expect("assertion#839: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#840: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_29")[0i64]
                .apply("hello", [()])
            @Expect("assertion#841: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_29(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Int64, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_30").size)
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [], [NonGenericStruct()])
            @Expect("assertion#842: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#843: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#844: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#845: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#846: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#847: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#848: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#849: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [], [()])
            @Expect("assertion#850: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#851: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#852: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#853: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#854: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#855: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#856: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Int64, Int64, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
            .apply(StandardClassType<Int64, Int64, UInt8>(), [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#857: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Int64, UInt8>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#858: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Int64, UInt8>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [])
            @Expect("assertion#859: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [])
            @Expect("assertion#860: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [])
            @Expect("assertion#861: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [])
            @Expect("assertion#862: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [])
            @Expect("assertion#863: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [])
            @Expect("assertion#864: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#865: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#866: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#867: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(StandardClassType<Int64, Int64, UInt8>(), [()])
            @Expect("assertion#868: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#869: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_30")[0i64]
                .apply("hello", [()])
            @Expect("assertion#870: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }
}
