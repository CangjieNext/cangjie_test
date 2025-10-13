/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
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
class testGetStaticFunctions_StandardClassType_3 {
    @TestCase
    func TestCase_228(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>().getStaticFunctions("classStaticMemberFunction_11").size)
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [], [NonGenericClass()])
            @Expect("assertion#7154: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#7155: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7156: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7157: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [], [])
            @Expect("assertion#7158: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7159: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7160: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7161: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [], [()])
            @Expect("assertion#7162: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7163: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<UInt32, UInt8, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_11")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#7164: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [])
            @Expect("assertion#7165: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7166: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [])
            @Expect("assertion#7167: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7168: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7169: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7170: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [()])
            @Expect("assertion#7171: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_11")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7172: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
    }

    @TestCase
    func TestCase_229(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>().getStaticFunctions("classStaticMemberFunction_12").size)
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [], [NonGenericClass()])
            @Expect("assertion#7173: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#7174: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7175: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7176: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [], [])
            @Expect("assertion#7177: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7178: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7179: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7180: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [], [()])
            @Expect("assertion#7181: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7182: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Int64, UInt32, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_12")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#7183: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [])
            @Expect("assertion#7184: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7185: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [])
            @Expect("assertion#7186: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7187: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7188: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7189: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Int16>>(), [()])
            @Expect("assertion#7190: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_12")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7191: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Int16> got.")
        }
    }

    @TestCase
    func TestCase_230(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Bool, Int64>>().getStaticFunctions("classStaticMemberFunction_13").size)
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Int64>>(), [], [NonGenericClass()])
            @Expect("assertion#7192: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#7193: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7194: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7195: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Int64>>(), [], [])
            @Expect("assertion#7196: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7197: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Int64>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7198: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7199: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Int64>>(), [], [()])
            @Expect("assertion#7200: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7201: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Unit, Bool, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_13")[0i64]
            .apply(TypeInfo.of<StandardClassType<Unit, Bool, Int64>>(), [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#7202: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Bool, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Int64>>(), [])
            @Expect("assertion#7203: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7204: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Bool, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Int64>>(), [])
            @Expect("assertion#7205: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7206: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Bool, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Int64>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7207: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7208: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Bool, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Int64>>(), [()])
            @Expect("assertion#7209: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_13")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7210: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Bool, Int64> got.")
        }
    }

    @TestCase
    func TestCase_231(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>().getStaticFunctions("classStaticMemberFunction_14").size)
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [], [NonGenericClass()])
            @Expect("assertion#7211: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#7212: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7213: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7214: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [], [])
            @Expect("assertion#7215: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7216: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7217: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7218: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [], [()])
            @Expect("assertion#7219: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7220: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Float32, Float32, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_14")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#7221: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [])
            @Expect("assertion#7222: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7223: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [])
            @Expect("assertion#7224: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7225: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7226: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7227: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float32, UInt16>>(), [()])
            @Expect("assertion#7228: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_14")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7229: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Float32, UInt16> got.")
        }
    }

    @TestCase
    func TestCase_232(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Float32, Int8>>().getStaticFunctions("classStaticMemberFunction_15").size)
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, Int8>>(), [], [NonGenericClass()])
            @Expect("assertion#7230: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#7231: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7232: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, Int8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7233: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, Int8>>(), [], [])
            @Expect("assertion#7234: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7235: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, Int8>>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7236: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7237: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, Int8>>(), [], [()])
            @Expect("assertion#7238: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7239: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Int16, Float32, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_15")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, Float32, Int8>>(), [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#7240: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, Int8>>(), [])
            @Expect("assertion#7241: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7242: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, Int8>>(), [])
            @Expect("assertion#7243: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7244: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, Int8>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7245: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#7246: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, Int8>>(), [()])
            @Expect("assertion#7247: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_15")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7248: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, Int8> got.")
        }
    }
}
