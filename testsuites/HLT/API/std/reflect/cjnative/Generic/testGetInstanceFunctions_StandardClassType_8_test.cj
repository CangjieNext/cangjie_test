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
class testGetInstanceFunctions_StandardClassType_8 {
    @TestCase
    func TestCase_35(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, UInt16, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_36").size)
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1016: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1017: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1018: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1019: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1020: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1021: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1022: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1023: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [], [()])
            @Expect("assertion#1024: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1025: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1026: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1027: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1028: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1029: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1030: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<UInt16, UInt16, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
            .apply(StandardClassType<UInt16, UInt16, UInt64>(), [GenericStructWith1TypeParameters<Bool>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1031: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt16, UInt16, UInt64>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1032: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt16, UInt16, UInt64>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [])
            @Expect("assertion#1033: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1034: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [])
            @Expect("assertion#1035: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [])
            @Expect("assertion#1036: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1037: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [])
            @Expect("assertion#1038: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1039: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1040: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1041: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(StandardClassType<UInt16, UInt16, UInt64>(), [()])
            @Expect("assertion#1042: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1043: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_36")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1044: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_36(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Int32, Bool>>().getInstanceFunctions("classInstanceMemberFunction_37").size)
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#1045: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#1046: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1047: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1048: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1049: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#1050: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1051: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#1052: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [], [()])
            @Expect("assertion#1053: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1054: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#1055: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1056: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1057: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#1058: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1059: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Bool, Int32, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
            .apply(StandardClassType<Bool, Int32, Bool>(), [GenericStructWith1TypeParameters<Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#1060: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int32, Bool>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#1061: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Bool, Int32, Bool>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [])
            @Expect("assertion#1062: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1063: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [])
            @Expect("assertion#1064: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [])
            @Expect("assertion#1065: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1066: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [])
            @Expect("assertion#1067: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#1068: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#1069: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#1070: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(StandardClassType<Bool, Int32, Bool>(), [()])
            @Expect("assertion#1071: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1072: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_37")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1073: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_37(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Bool, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_38").size)
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#1074: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#1075: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1076: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1077: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1078: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#1079: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1080: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#1081: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [], [()])
            @Expect("assertion#1082: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1083: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#1084: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1085: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1086: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#1087: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1088: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<UInt64, Bool, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
            .apply(StandardClassType<UInt64, Bool, UInt32>(), [GenericStructWith1TypeParameters<UInt64>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#1089: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, Bool, UInt32>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#1090: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, Bool, UInt32>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [])
            @Expect("assertion#1091: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1092: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [])
            @Expect("assertion#1093: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [])
            @Expect("assertion#1094: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1095: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [])
            @Expect("assertion#1096: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(),
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#1097: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#1098: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#1099: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(StandardClassType<UInt64, Bool, UInt32>(), [()])
            @Expect("assertion#1100: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1101: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_38")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1102: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_38(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Bool, Int64>>().getInstanceFunctions("classInstanceMemberFunction_39").size)
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1103: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1104: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1105: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1106: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1107: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1108: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1109: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1110: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [], [()])
            @Expect("assertion#1111: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1112: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1113: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1114: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1115: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1116: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1117: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Int64, Bool, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
            .apply(StandardClassType<Int64, Bool, Int64>(), [GenericStructWith1TypeParameters<Bool>()])
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1118: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Bool, Int64>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#1119: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int64, Bool, Int64>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [])
            @Expect("assertion#1120: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1121: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [])
            @Expect("assertion#1122: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [])
            @Expect("assertion#1123: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1124: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [])
            @Expect("assertion#1125: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1126: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1127: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#1128: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(StandardClassType<Int64, Bool, Int64>(), [()])
            @Expect("assertion#1129: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1130: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, Bool, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_39")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1131: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_39(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt16, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_40").size)
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [], [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#1132: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#1133: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1134: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1135: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1136: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#1137: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1138: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [],
                    [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#1139: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [], [()])
            @Expect("assertion#1140: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1141: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [], [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#1142: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1143: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1144: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [], [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#1145: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1146: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<UInt32, UInt16, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
            .apply(StandardClassType<UInt32, UInt16, UInt32>(), [GenericStructWith1TypeParameters<UInt32>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#1147: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt32, UInt16, UInt32>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#1148: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt32, UInt16, UInt32>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [])
            @Expect("assertion#1149: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1150: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [])
            @Expect("assertion#1151: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [])
            @Expect("assertion#1152: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1153: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [])
            @Expect("assertion#1154: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(),
                    [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#1155: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#1156: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#1157: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(StandardClassType<UInt32, UInt16, UInt32>(), [()])
            @Expect("assertion#1158: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1159: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt16, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_40")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1160: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }
}
