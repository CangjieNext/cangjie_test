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
class testGetStaticFunctions_StandardStructType_9 {
    @TestCase
    func TestCase_367(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>().getStaticFunctions("classStaticMemberFunction_150").size)
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#10435: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#10436: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10437: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10438: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [], [])
            @Expect("assertion#10439: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10440: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10441: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10442: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [], [()])
            @Expect("assertion#10443: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10444: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<UInt16, Unit, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_150")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(),
                [GenericStructWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#10445: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [])
            @Expect("assertion#10446: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10447: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [])
            @Expect("assertion#10448: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10449: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10450: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#10451: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, Bool> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Unit, Bool>>(), [()])
            @Expect("assertion#10452: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_150")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10453: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Unit, Bool> got.")
        }
    }

    @TestCase
    func TestCase_368(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>().getStaticFunctions("classStaticMemberFunction_151").size)
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#10454: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#10455: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10456: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10457: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [], [])
            @Expect("assertion#10458: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10459: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#10460: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#10461: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [], [()])
            @Expect("assertion#10462: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10463: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<UInt16, Int32, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_151")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(),
                [GenericStructWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#10464: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [])
            @Expect("assertion#10465: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10466: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [])
            @Expect("assertion#10467: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10468: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#10469: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#10470: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, UInt32>>(), [()])
            @Expect("assertion#10471: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_151")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10472: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, UInt32> got.")
        }
    }

    @TestCase
    func TestCase_369(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, UInt16, Unit>>().getStaticFunctions("classStaticMemberFunction_152").size)
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Unit>>(), [],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#10473: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#10474: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10475: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Unit>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10476: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Unit>>(), [], [])
            @Expect("assertion#10477: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10478: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Unit>>(), [],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#10479: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#10480: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Unit>>(), [], [()])
            @Expect("assertion#10481: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10482: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<UInt64, UInt16, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_152")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Unit>>(),
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#10483: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt16, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Unit>>(), [])
            @Expect("assertion#10484: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10485: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt16, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Unit>>(), [])
            @Expect("assertion#10486: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10487: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt16, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Unit>>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#10488: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#10489: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt16, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Unit>>(), [()])
            @Expect("assertion#10490: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_152")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10491: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt16, Unit> got.")
        }
    }

    @TestCase
    func TestCase_370(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Float64, Int16>>().getStaticFunctions("classStaticMemberFunction_153").size)
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#10492: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#10493: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10494: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10495: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [], [])
            @Expect("assertion#10496: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10497: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#10498: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#10499: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [], [()])
            @Expect("assertion#10500: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10501: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Float64, Float64, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_153")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(),
                [GenericStructWith2TypeParameters<Float64, Float64>()])
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#10502: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [])
            @Expect("assertion#10503: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10504: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [])
            @Expect("assertion#10505: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10506: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(),
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#10507: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#10508: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Int16>>(), [()])
            @Expect("assertion#10509: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_153")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10510: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Int16> got.")
        }
    }

    @TestCase
    func TestCase_371(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Float32, Int16>>().getStaticFunctions("classStaticMemberFunction_154").size)
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#10511: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#10512: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10513: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10514: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [], [])
            @Expect("assertion#10515: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10516: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10517: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10518: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [], [()])
            @Expect("assertion#10519: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10520: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Float32, Float32, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_154")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(),
                [GenericStructWith2TypeParameters<Float32, Float32>()])
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#10521: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Float32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [])
            @Expect("assertion#10522: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10523: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Float32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [])
            @Expect("assertion#10524: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10525: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Float32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(),
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10526: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#10527: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Float32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Float32, Int16>>(), [()])
            @Expect("assertion#10528: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_154")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10529: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Float32, Int16> got.")
        }
    }
}
