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
class testGetStaticFunctions_StandardStructType_2 {
    @TestCase
    func TestCase_332(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>().getStaticFunctions("classStaticMemberFunction_115").size)
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [], [true])
            @Expect("assertion#9770: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [true])
            @Expect("assertion#9771: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9772: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9773: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [], [])
            @Expect("assertion#9774: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9775: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [], [true, 114.514000f64])
            @Expect("assertion#9776: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [true, 114.514000f64])
            @Expect("assertion#9777: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [], [()])
            @Expect("assertion#9778: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#9779: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<UInt16, UInt32, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_115")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [true])
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [true])
            @Expect("assertion#9780: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [])
            @Expect("assertion#9781: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9782: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [])
            @Expect("assertion#9783: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9784: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [true, 114.514000f64])
            @Expect("assertion#9785: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [true, 114.514000f64])
            @Expect("assertion#9786: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, UInt32, Float32>>(), [()])
            @Expect("assertion#9787: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_115")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9788: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, UInt32, Float32> got.")
        }
    }

    @TestCase
    func TestCase_333(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>().getStaticFunctions("classStaticMemberFunction_116").size)
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [], [()])
            @Expect("assertion#9789: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#9790: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9791: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9792: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [], [])
            @Expect("assertion#9793: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9794: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [], [(), 114.514000f64])
            @Expect("assertion#9795: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#9796: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [], [123i64])
            @Expect("assertion#9797: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#9798: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<UInt16, Bool, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_116")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [()])
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9799: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [])
            @Expect("assertion#9800: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9801: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [])
            @Expect("assertion#9802: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9803: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [(), 114.514000f64])
            @Expect("assertion#9804: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [(), 114.514000f64])
            @Expect("assertion#9805: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float64>>(), [123i64])
            @Expect("assertion#9806: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_116")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#9807: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float64> got.")
        }
    }

    @TestCase
    func TestCase_334(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>().getStaticFunctions("classStaticMemberFunction_117").size)
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [], [1i8])
            @Expect("assertion#9808: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1i8])
            @Expect("assertion#9809: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9810: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9811: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [], [])
            @Expect("assertion#9812: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9813: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [], [1i8, 114.514000f64])
            @Expect("assertion#9814: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1i8, 114.514000f64])
            @Expect("assertion#9815: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [], [114.514000f64])
            @Expect("assertion#9816: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#9817: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Int8, Float32, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_117")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [1i8])
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i8])
            @Expect("assertion#9818: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Float32, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [])
            @Expect("assertion#9819: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9820: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Float32, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [])
            @Expect("assertion#9821: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9822: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Float32, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [1i8, 114.514000f64])
            @Expect("assertion#9823: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i8, 114.514000f64])
            @Expect("assertion#9824: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Float32, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Float32, UInt32>>(), [114.514000f64])
            @Expect("assertion#9825: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_117")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#9826: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Float32, UInt32> got.")
        }
    }

    @TestCase
    func TestCase_335(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt16, Int64>>().getStaticFunctions("classStaticMemberFunction_118").size)
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt16, Int64>>(), [], [1u16])
            @Expect("assertion#9827: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1u16])
            @Expect("assertion#9828: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9829: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt16, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9830: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt16, Int64>>(), [], [])
            @Expect("assertion#9831: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9832: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt16, Int64>>(), [], [1u16, 114.514000f64])
            @Expect("assertion#9833: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1u16, 114.514000f64])
            @Expect("assertion#9834: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt16, Int64>>(), [], [114.514000f64])
            @Expect("assertion#9835: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#9836: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Bool, UInt16, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_118")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, UInt16, Int64>>(), [1u16])
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<Int64>(), [1u16])
            @Expect("assertion#9837: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt16, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt16, Int64>>(), [])
            @Expect("assertion#9838: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9839: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt16, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt16, Int64>>(), [])
            @Expect("assertion#9840: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9841: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt16, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt16, Int64>>(), [1u16, 114.514000f64])
            @Expect("assertion#9842: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<Int64>(), [1u16, 114.514000f64])
            @Expect("assertion#9843: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt16, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt16, Int64>>(), [114.514000f64])
            @Expect("assertion#9844: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_118")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#9845: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt16, Int64> got.")
        }
    }

    @TestCase
    func TestCase_336(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, UInt32, Int16>>().getStaticFunctions("classStaticMemberFunction_119").size)
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt32, Int16>>(), [], [1i16])
            @Expect("assertion#9846: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1i16])
            @Expect("assertion#9847: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#9848: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt32, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9849: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt32, Int16>>(), [], [])
            @Expect("assertion#9850: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#9851: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt32, Int16>>(), [], [1i16, 114.514000f64])
            @Expect("assertion#9852: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [1i16, 114.514000f64])
            @Expect("assertion#9853: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt32, Int16>>(), [], [114.514000f64])
            @Expect("assertion#9854: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#9855: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Int32, UInt32, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_119")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, UInt32, Int16>>(), [1i16])
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i16])
            @Expect("assertion#9856: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt32, Int16>>(), [])
            @Expect("assertion#9857: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9858: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt32, Int16>>(), [])
            @Expect("assertion#9859: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9860: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt32, Int16>>(), [1i16, 114.514000f64])
            @Expect("assertion#9861: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i16, 114.514000f64])
            @Expect("assertion#9862: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt32, Int16>>(), [114.514000f64])
            @Expect("assertion#9863: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_119")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#9864: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt32, Int16> got.")
        }
    }
}
