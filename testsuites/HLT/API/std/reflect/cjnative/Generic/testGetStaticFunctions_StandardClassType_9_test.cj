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
class testGetStaticFunctions_StandardClassType_9 {
    @TestCase
    func TestCase_258(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>().getStaticFunctions("classStaticMemberFunction_41").size)
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#7724: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#7725: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7726: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7727: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [], [])
            @Expect("assertion#7728: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7729: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7730: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7731: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [], [()])
            @Expect("assertion#7732: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7733: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Int32, UInt64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_41")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(),
                [GenericStructWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#7734: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [])
            @Expect("assertion#7735: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7736: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [])
            @Expect("assertion#7737: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7738: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7739: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7740: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt64, UInt16>>(), [()])
            @Expect("assertion#7741: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_41")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7742: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt64, UInt16> got.")
        }
    }

    @TestCase
    func TestCase_259(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, UInt16, UInt16>>().getStaticFunctions("classStaticMemberFunction_42").size)
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt16, UInt16>>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7743: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7744: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7745: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt16, UInt16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7746: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt16, UInt16>>(), [], [])
            @Expect("assertion#7747: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7748: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt16, UInt16>>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7749: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7750: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt16, UInt16>>(), [], [()])
            @Expect("assertion#7751: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7752: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Int8, UInt16, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_42")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int8, UInt16, UInt16>>(),
                [GenericStructWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7753: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt16, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt16, UInt16>>(), [])
            @Expect("assertion#7754: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7755: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt16, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt16, UInt16>>(), [])
            @Expect("assertion#7756: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7757: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt16, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt16, UInt16>>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7758: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7759: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt16, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt16, UInt16>>(), [()])
            @Expect("assertion#7760: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt16, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_42")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7761: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt16, UInt16> got.")
        }
    }

    @TestCase
    func TestCase_260(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Unit, Int64>>().getStaticFunctions("classStaticMemberFunction_43").size)
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#7762: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#7763: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7764: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7765: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [], [])
            @Expect("assertion#7766: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7767: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#7768: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#7769: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [], [()])
            @Expect("assertion#7770: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7771: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Int32, Unit, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_43")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(),
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#7772: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [])
            @Expect("assertion#7773: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7774: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [])
            @Expect("assertion#7775: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7776: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#7777: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#7778: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Unit, Int64>>(), [()])
            @Expect("assertion#7779: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int32, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_43")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7780: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Unit, Int64> got.")
        }
    }

    @TestCase
    func TestCase_261(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>().getStaticFunctions("classStaticMemberFunction_44").size)
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7781: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7782: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7783: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7784: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [], [])
            @Expect("assertion#7785: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7786: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7787: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7788: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [], [()])
            @Expect("assertion#7789: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7790: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Bool, UInt8, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_44")[0i64]
            .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#7791: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, UInt8, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [])
            @Expect("assertion#7792: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7793: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, UInt8, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [])
            @Expect("assertion#7794: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7795: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, UInt8, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7796: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#7797: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, UInt8, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, UInt8, Unit>>(), [()])
            @Expect("assertion#7798: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, UInt8, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_44")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7799: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, UInt8, Unit> got.")
        }
    }

    @TestCase
    func TestCase_262(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>().getStaticFunctions("classStaticMemberFunction_45").size)
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#7800: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#7801: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7802: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7803: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [], [])
            @Expect("assertion#7804: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7805: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#7806: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#7807: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [], [()])
            @Expect("assertion#7808: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7809: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<UInt64, Int32, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_45")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(),
                [GenericStructWith2TypeParameters<Int32, Int32>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#7810: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [])
            @Expect("assertion#7811: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7812: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [])
            @Expect("assertion#7813: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7814: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#7815: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#7816: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Int16> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Int16>>(), [()])
            @Expect("assertion#7817: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_45")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7818: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Int16> got.")
        }
    }
}
