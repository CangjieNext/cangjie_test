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
class testGetStaticFunctions_StandardClassType_10 {
    @TestCase
    func TestCase_263(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Unit, Float64>>().getStaticFunctions("classStaticMemberFunction_46").size)
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Float64>>(), [],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7819: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7820: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7821: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Float64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7822: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Float64>>(), [], [])
            @Expect("assertion#7823: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7824: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Float64>>(), [],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#7825: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#7826: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Float64>>(), [], [()])
            @Expect("assertion#7827: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7828: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Unit, Unit, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_46")[0i64]
            .apply(TypeInfo.of<StandardClassType<Unit, Unit, Float64>>(),
                [GenericStructWith2TypeParameters<Float64, Float64>()])
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7829: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Float64>>(), [])
            @Expect("assertion#7830: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7831: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Float64>>(), [])
            @Expect("assertion#7832: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7833: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Float64>>(),
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#7834: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#7835: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Float64>>(), [()])
            @Expect("assertion#7836: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_46")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7837: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Float64> got.")
        }
    }

    @TestCase
    func TestCase_264(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>().getStaticFunctions("classStaticMemberFunction_47").size)
        TypeInfo
            .of<StandardClassType<UInt16, UInt16, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_47")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64])
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64])
            @Expect("assertion#7838: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt16, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7839: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt16, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7840: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#7841: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7842: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt16, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [123i64, 114.514000f64])
            @Expect("assertion#7843: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt16, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#7844: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#7845: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#7846: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt16, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [123i64])
            @Expect("assertion#7847: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#7848: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#7849: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7850: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7851: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7852: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64, 114.514000f64])
            @Expect("assertion#7853: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64, 114.514000f64])
            @Expect("assertion#7854: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#7855: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#7856: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(), [123i64])
            @Expect("assertion#7857: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#7858: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(), [])
            @Expect("assertion#7859: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7860: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(), [])
            @Expect("assertion#7861: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7862: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(), [123i64, 114.514000f64])
            @Expect("assertion#7863: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#7864: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(), [114.514000f64])
            @Expect("assertion#7865: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#7866: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_265(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>().getStaticFunctions("classStaticMemberFunction_48").size)
        TypeInfo
            .of<StandardClassType<UInt16, Unit, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_48")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [true])
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [true])
            @Expect("assertion#7867: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Unit, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#7868: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Unit, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                    [])
            @Expect("assertion#7869: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#7870: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7871: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Unit, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [true, 114.514000f64])
            @Expect("assertion#7872: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Unit, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [true, 114.514000f64])
            @Expect("assertion#7873: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#7874: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#7875: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Unit, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [true])
            @Expect("assertion#7876: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [true])
            @Expect("assertion#7877: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#7878: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7879: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#7880: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                    [])
            @Expect("assertion#7881: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [true, 114.514000f64])
            @Expect("assertion#7882: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                    [true, 114.514000f64])
            @Expect("assertion#7883: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#7884: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#7885: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [true])
            @Expect("assertion#7886: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [true])
            @Expect("assertion#7887: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [])
            @Expect("assertion#7888: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7889: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [])
            @Expect("assertion#7890: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7891: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [true, 114.514000f64])
            @Expect("assertion#7892: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [true, 114.514000f64])
            @Expect("assertion#7893: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [()])
            @Expect("assertion#7894: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7895: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_266(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Unit, Int16>>().getStaticFunctions("classStaticMemberFunction_49").size)
        TypeInfo
            .of<StandardClassType<Int32, Unit, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_49")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [()])
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#7896: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#7897: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                    [])
            @Expect("assertion#7898: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#7899: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7900: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [(), 114.514000f64])
            @Expect("assertion#7901: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [(), 114.514000f64])
            @Expect("assertion#7902: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [123i64])
            @Expect("assertion#7903: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [123i64])
            @Expect("assertion#7904: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                    [()])
            @Expect("assertion#7905: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#7906: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#7907: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7908: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#7909: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                    [])
            @Expect("assertion#7910: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [(), 114.514000f64])
            @Expect("assertion#7911: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                    [(), 114.514000f64])
            @Expect("assertion#7912: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                    [123i64])
            @Expect("assertion#7913: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#7914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(), [()])
            @Expect("assertion#7915: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7916: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(), [])
            @Expect("assertion#7917: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7918: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(), [])
            @Expect("assertion#7919: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7920: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(), [(), 114.514000f64])
            @Expect("assertion#7921: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<Int64>(), [(), 114.514000f64])
            @Expect("assertion#7922: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int16>>(), [123i64])
            @Expect("assertion#7923: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_49")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#7924: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_267(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>().getStaticFunctions("classStaticMemberFunction_50").size)
        TypeInfo
            .of<StandardClassType<Int64, Float64, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_50")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [123i64])
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [123i64])
            @Expect("assertion#7925: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#7926: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#7927: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#7928: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7929: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [123i64, 114.514000f64])
            @Expect("assertion#7930: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#7931: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#7932: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#7933: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Float64, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [123i64])
            @Expect("assertion#7934: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#7935: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#7936: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7937: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#7938: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#7939: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [123i64, 114.514000f64])
            @Expect("assertion#7940: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [123i64, 114.514000f64])
            @Expect("assertion#7941: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#7942: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#7943: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(), [123i64])
            @Expect("assertion#7944: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#7945: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(), [])
            @Expect("assertion#7946: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7947: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(), [])
            @Expect("assertion#7948: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7949: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(), [123i64, 114.514000f64])
            @Expect("assertion#7950: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#7951: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Float64, UInt64>>(), [114.514000f64])
            @Expect("assertion#7952: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Float64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_50")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#7953: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
