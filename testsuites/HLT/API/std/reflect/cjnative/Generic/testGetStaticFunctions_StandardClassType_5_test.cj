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
class testGetStaticFunctions_StandardClassType_5 {
    @TestCase
    func TestCase_238(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, UInt32, Int32>>().getStaticFunctions("classStaticMemberFunction_21").size)
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, Int32>>(), [],
                    [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#7344: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#7345: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7346: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, Int32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7347: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, Int32>>(), [], [])
            @Expect("assertion#7348: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7349: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, Int32>>(), [],
                    [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#7350: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#7351: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, Int32>>(), [], [()])
            @Expect("assertion#7352: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7353: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Unit, UInt32, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_21")[0i64]
            .apply(TypeInfo.of<StandardClassType<Unit, UInt32, Int32>>(), [GenericClassWith1TypeParameters<UInt32>()])
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#7354: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt32, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, Int32>>(), [])
            @Expect("assertion#7355: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7356: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt32, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, Int32>>(), [])
            @Expect("assertion#7357: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7358: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt32, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, Int32>>(),
                    [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#7359: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#7360: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt32, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, Int32>>(), [()])
            @Expect("assertion#7361: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_21")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7362: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt32, Int32> got.")
        }
    }

    @TestCase
    func TestCase_239(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Bool, UInt8>>().getStaticFunctions("classStaticMemberFunction_22").size)
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Bool, UInt8>>(), [],
                    [GenericClassWith1TypeParameters<UInt8>()])
            @Expect("assertion#7363: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<UInt8>()])
            @Expect("assertion#7364: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7365: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Bool, UInt8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7366: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Bool, UInt8>>(), [], [])
            @Expect("assertion#7367: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7368: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Bool, UInt8>>(), [],
                    [GenericClassWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#7369: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#7370: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Bool, UInt8>>(), [], [()])
            @Expect("assertion#7371: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7372: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Float32, Bool, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_22")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, Bool, UInt8>>(), [GenericClassWith1TypeParameters<UInt8>()])
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<UInt8>()])
            @Expect("assertion#7373: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Bool, UInt8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Bool, UInt8>>(), [])
            @Expect("assertion#7374: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7375: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Bool, UInt8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Bool, UInt8>>(), [])
            @Expect("assertion#7376: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7377: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Bool, UInt8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Bool, UInt8>>(),
                    [GenericClassWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#7378: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#7379: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Bool, UInt8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Bool, UInt8>>(), [()])
            @Expect("assertion#7380: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_22")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7381: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Bool, UInt8> got.")
        }
    }

    @TestCase
    func TestCase_240(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, UInt64, Int8>>().getStaticFunctions("classStaticMemberFunction_23").size)
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Int8>>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#7382: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#7383: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7384: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Int8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7385: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Int8>>(), [], [])
            @Expect("assertion#7386: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7387: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Int8>>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7388: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7389: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Int8>>(), [], [()])
            @Expect("assertion#7390: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7391: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Int16, UInt64, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_23")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Int8>>(),
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#7392: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Int8>>(), [])
            @Expect("assertion#7393: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7394: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Int8>>(), [])
            @Expect("assertion#7395: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7396: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Int8>>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7397: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7398: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Int8>>(), [()])
            @Expect("assertion#7399: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_23")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7400: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Int8> got.")
        }
    }

    @TestCase
    func TestCase_241(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Int16, Int64>>().getStaticFunctions("classStaticMemberFunction_24").size)
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7401: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7402: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7403: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7404: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [], [])
            @Expect("assertion#7405: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7406: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7407: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7408: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [], [()])
            @Expect("assertion#7409: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7410: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Int64, Int16, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_24")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(),
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7411: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int16, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [])
            @Expect("assertion#7412: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7413: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int16, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [])
            @Expect("assertion#7414: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7415: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int16, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7416: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7417: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int16, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int16, Int64>>(), [()])
            @Expect("assertion#7418: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_24")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7419: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int16, Int64> got.")
        }
    }

    @TestCase
    func TestCase_242(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Unit, Bool>>().getStaticFunctions("classStaticMemberFunction_25").size)
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Bool>>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#7420: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#7421: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7422: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Bool>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7423: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Bool>>(), [], [])
            @Expect("assertion#7424: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7425: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Bool>>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#7426: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#7427: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Bool>>(), [], [()])
            @Expect("assertion#7428: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7429: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Bool, Unit, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_25")[0i64]
            .apply(TypeInfo.of<StandardClassType<Bool, Unit, Bool>>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#7430: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Unit, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Bool>>(), [])
            @Expect("assertion#7431: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7432: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Unit, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Bool>>(), [])
            @Expect("assertion#7433: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7434: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Unit, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Bool>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#7435: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#7436: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Unit, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Unit, Bool>>(), [()])
            @Expect("assertion#7437: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_25")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7438: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Unit, Bool> got.")
        }
    }
}
