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
class testGetStaticFunctions_StandardStructType_3 {
    @TestCase
    func TestCase_337(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Unit, UInt16>>().getStaticFunctions("classStaticMemberFunction_120").size)
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, UInt16>>(), [], [NonGenericClass()])
            @Expect("assertion#9865: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#9866: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9867: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, UInt16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9868: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, UInt16>>(), [], [])
            @Expect("assertion#9869: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9870: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, UInt16>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9871: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9872: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, UInt16>>(), [], [()])
            @Expect("assertion#9873: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#9874: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<UInt16, Unit, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_120")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, Unit, UInt16>>(), [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#9875: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, UInt16>>(), [])
            @Expect("assertion#9876: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9877: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, UInt16>>(), [])
            @Expect("assertion#9878: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9879: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, UInt16>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9880: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9881: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, UInt16>>(), [()])
            @Expect("assertion#9882: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_120")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9883: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, UInt16> got.")
        }
    }

    @TestCase
    func TestCase_338(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>().getStaticFunctions("classStaticMemberFunction_121").size)
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(), [], [NonGenericClass()])
            @Expect("assertion#9884: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#9885: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9886: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9887: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(), [], [])
            @Expect("assertion#9888: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9889: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9890: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9891: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(), [], [()])
            @Expect("assertion#9892: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#9893: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Int16, Int64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_121")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(), [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#9894: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(), [])
            @Expect("assertion#9895: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9896: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(), [])
            @Expect("assertion#9897: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9898: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9899: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9900: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(), [()])
            @Expect("assertion#9901: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_121")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9902: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, UInt16> got.")
        }
    }

    @TestCase
    func TestCase_339(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int8, Int32>>().getStaticFunctions("classStaticMemberFunction_122").size)
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [], [NonGenericClass()])
            @Expect("assertion#9903: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#9904: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9905: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9906: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [], [])
            @Expect("assertion#9907: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9908: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9909: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9910: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [], [()])
            @Expect("assertion#9911: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#9912: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Float64, Int8, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_122")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#9913: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [])
            @Expect("assertion#9914: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9915: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [])
            @Expect("assertion#9916: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9917: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9918: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9919: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [()])
            @Expect("assertion#9920: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_122")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9921: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
    }

    @TestCase
    func TestCase_340(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>().getStaticFunctions("classStaticMemberFunction_123").size)
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [], [NonGenericClass()])
            @Expect("assertion#9922: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#9923: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9924: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9925: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [], [])
            @Expect("assertion#9926: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9927: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9928: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9929: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [], [()])
            @Expect("assertion#9930: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#9931: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Int32, Unit, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_123")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#9932: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [])
            @Expect("assertion#9933: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9934: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [])
            @Expect("assertion#9935: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9936: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9937: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9938: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [()])
            @Expect("assertion#9939: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_123")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9940: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt16> got.")
        }
    }

    @TestCase
    func TestCase_341(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Unit, Unit>>().getStaticFunctions("classStaticMemberFunction_124").size)
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [], [NonGenericClass()])
            @Expect("assertion#9941: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#9942: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9943: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9944: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [], [])
            @Expect("assertion#9945: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9946: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9947: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9948: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [], [()])
            @Expect("assertion#9949: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#9950: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Float64, Unit, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_124")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#9951: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [])
            @Expect("assertion#9952: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9953: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [])
            @Expect("assertion#9954: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9955: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9956: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#9957: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Unit, Unit>>(), [()])
            @Expect("assertion#9958: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Unit, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_124")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9959: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Unit, Unit> got.")
        }
    }
}
