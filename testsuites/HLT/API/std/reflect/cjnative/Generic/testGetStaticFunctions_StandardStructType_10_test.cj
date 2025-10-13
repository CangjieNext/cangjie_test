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
class testGetStaticFunctions_StandardStructType_10 {
    @TestCase
    func TestCase_372(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, Bool, Float32>>().getStaticFunctions("classStaticMemberFunction_155").size)
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, Float32>>(), [],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#10530: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#10531: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10532: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, Float32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10533: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, Float32>>(), [], [])
            @Expect("assertion#10534: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10535: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, Float32>>(), [],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10536: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10537: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, Float32>>(), [], [()])
            @Expect("assertion#10538: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10539: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<UInt64, Bool, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_155")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, Bool, Float32>>(),
                [GenericStructWith2TypeParameters<Float32, Float32>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#10540: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Bool, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, Float32>>(), [])
            @Expect("assertion#10541: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10542: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Bool, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, Float32>>(), [])
            @Expect("assertion#10543: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10544: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Bool, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, Float32>>(),
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10545: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10546: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Bool, Float32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, Float32>>(), [()])
            @Expect("assertion#10547: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_155")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10548: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Bool, Float32> got.")
        }
    }

    @TestCase
    func TestCase_373(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>().getStaticFunctions("classStaticMemberFunction_156").size)
        TypeInfo
            .of<StandardStructType<UInt32, UInt8, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_156")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [123i64])
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#10549: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt8, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#10550: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt8, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#10551: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10552: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10553: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt8, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [123i64, 114.514000f64])
            @Expect("assertion#10554: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt8, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#10555: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#10556: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#10557: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt8, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [123i64])
            @Expect("assertion#10558: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#10559: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10560: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10561: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#10562: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#10563: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#10564: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#10565: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#10566: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#10567: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(), [123i64])
            @Expect("assertion#10568: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#10569: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(), [])
            @Expect("assertion#10570: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10571: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(), [])
            @Expect("assertion#10572: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10573: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(), [123i64, 114.514000f64])
            @Expect("assertion#10574: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#10575: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(), [114.514000f64])
            @Expect("assertion#10576: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#10577: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_374(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>().getStaticFunctions("classStaticMemberFunction_157").size)
        TypeInfo
            .of<StandardStructType<Unit, UInt8, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_157")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [true])
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [true])
            @Expect("assertion#10578: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10579: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10580: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#10581: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10582: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [true, 114.514000f64])
            @Expect("assertion#10583: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [true, 114.514000f64])
            @Expect("assertion#10584: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#10585: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#10586: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [true])
            @Expect("assertion#10587: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [true])
            @Expect("assertion#10588: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#10589: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10590: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10591: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10592: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [true, 114.514000f64])
            @Expect("assertion#10593: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [true, 114.514000f64])
            @Expect("assertion#10594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#10595: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10596: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [true])
            @Expect("assertion#10597: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [true])
            @Expect("assertion#10598: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [])
            @Expect("assertion#10599: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10600: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [])
            @Expect("assertion#10601: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10602: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [true, 114.514000f64])
            @Expect("assertion#10603: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [true, 114.514000f64])
            @Expect("assertion#10604: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [()])
            @Expect("assertion#10605: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10606: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_375(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>().getStaticFunctions("classStaticMemberFunction_158").size)
        TypeInfo
            .of<StandardStructType<Unit, UInt8, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_158")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [()])
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#10607: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10608: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10610: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10611: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [(), 114.514000f64])
            @Expect("assertion#10612: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [(), 114.514000f64])
            @Expect("assertion#10613: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [123i64])
            @Expect("assertion#10614: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [123i64])
            @Expect("assertion#10615: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#10616: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10617: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10618: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10619: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10620: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10621: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [(), 114.514000f64])
            @Expect("assertion#10622: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [(), 114.514000f64])
            @Expect("assertion#10623: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [123i64])
            @Expect("assertion#10624: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#10625: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [()])
            @Expect("assertion#10626: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10627: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [])
            @Expect("assertion#10628: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10629: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [])
            @Expect("assertion#10630: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10631: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [(), 114.514000f64])
            @Expect("assertion#10632: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [(), 114.514000f64])
            @Expect("assertion#10633: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [123i64])
            @Expect("assertion#10634: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#10635: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_376(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>().getStaticFunctions("classStaticMemberFunction_159").size)
        TypeInfo
            .of<StandardStructType<UInt32, Float64, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_159")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [1u32])
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [1u32])
            @Expect("assertion#10636: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Float64, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10637: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Float64, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10638: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#10639: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10640: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Float64, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [1u32, 114.514000f64])
            @Expect("assertion#10641: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Float64, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [1u32, 114.514000f64])
            @Expect("assertion#10642: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#10643: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#10644: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Float64, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [1u32])
            @Expect("assertion#10645: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [1u32])
            @Expect("assertion#10646: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#10647: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10648: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10649: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10650: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [1u32, 114.514000f64])
            @Expect("assertion#10651: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [1u32, 114.514000f64])
            @Expect("assertion#10652: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [114.514000f64])
            @Expect("assertion#10653: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#10654: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(), [1u32])
            @Expect("assertion#10655: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [1u32])
            @Expect("assertion#10656: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(), [])
            @Expect("assertion#10657: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10658: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(), [])
            @Expect("assertion#10659: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10660: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(), [1u32, 114.514000f64])
            @Expect("assertion#10661: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [1u32, 114.514000f64])
            @Expect("assertion#10662: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(), [114.514000f64])
            @Expect("assertion#10663: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#10664: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
