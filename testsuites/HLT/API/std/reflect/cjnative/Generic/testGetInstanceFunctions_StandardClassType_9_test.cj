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
class testGetInstanceFunctions_StandardClassType_9 {
    @TestCase
    func TestCase_40(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int32, Unit>>().getInstanceFunctions("classInstanceMemberFunction_41").size)
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#1161: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#1162: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1163: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1164: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1165: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#1166: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1167: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#1168: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [], [()])
            @Expect("assertion#1169: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1170: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#1171: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1172: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1173: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#1174: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1175: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Int16, Int32, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
            .apply(StandardClassType<Int16, Int32, Unit>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#1176: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int16, Int32, Unit>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#1177: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<Int16, Int32, Unit>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [])
            @Expect("assertion#1178: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1179: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [])
            @Expect("assertion#1180: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [])
            @Expect("assertion#1181: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1182: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [])
            @Expect("assertion#1183: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#1184: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#1185: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#1186: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(StandardClassType<Int16, Int32, Unit>(), [()])
            @Expect("assertion#1187: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1188: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_41")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1189: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_41(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Unit, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_42").size)
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#1190: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#1191: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1192: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1193: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1194: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#1195: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1196: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#1197: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [], [()])
            @Expect("assertion#1198: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1199: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#1200: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1201: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1202: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#1203: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1204: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<UInt32, Unit, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
            .apply(StandardClassType<UInt32, Unit, UInt64>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#1205: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt32, Unit, UInt64>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#1206: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt32, Unit, UInt64>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [])
            @Expect("assertion#1207: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1208: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [])
            @Expect("assertion#1209: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [])
            @Expect("assertion#1210: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1211: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [])
            @Expect("assertion#1212: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#1213: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#1214: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#1215: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(StandardClassType<UInt32, Unit, UInt64>(), [()])
            @Expect("assertion#1216: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1217: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_42")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1218: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_42(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int16, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_43").size)
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#1219: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#1220: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1221: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1222: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1223: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#1224: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1225: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#1226: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [], [()])
            @Expect("assertion#1227: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1228: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#1229: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1230: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1231: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#1232: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1233: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<UInt64, Int16, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
            .apply(StandardClassType<UInt64, Int16, UInt64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#1234: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, Int16, UInt64>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#1235: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, Int16, UInt64>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [])
            @Expect("assertion#1236: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1237: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [])
            @Expect("assertion#1238: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [])
            @Expect("assertion#1239: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1240: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [])
            @Expect("assertion#1241: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#1242: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#1243: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#1244: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(StandardClassType<UInt64, Int16, UInt64>(), [()])
            @Expect("assertion#1245: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1246: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_43")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1247: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_43(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, UInt16, Bool>>().getInstanceFunctions("classInstanceMemberFunction_44").size)
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#1248: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#1249: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1250: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1251: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1252: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#1253: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1254: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [],
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#1255: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [], [()])
            @Expect("assertion#1256: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1257: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#1258: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1259: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1260: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#1261: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1262: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<UInt64, UInt16, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
            .apply(StandardClassType<UInt64, UInt16, Bool>(), [GenericStructWith2TypeParameters<UInt64, UInt64>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#1263: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, UInt16, Bool>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#1264: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt64, UInt16, Bool>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [])
            @Expect("assertion#1265: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1266: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [])
            @Expect("assertion#1267: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [])
            @Expect("assertion#1268: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1269: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [])
            @Expect("assertion#1270: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(),
                    [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#1271: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#1272: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#1273: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(StandardClassType<UInt64, UInt16, Bool>(), [()])
            @Expect("assertion#1274: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1275: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_44")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1276: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_44(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, UInt8, Bool>>().getInstanceFunctions("classInstanceMemberFunction_45").size)
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [], [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#1277: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#1278: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1279: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1280: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1281: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#1282: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1283: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#1284: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [], [()])
            @Expect("assertion#1285: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1286: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#1287: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1288: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1289: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#1290: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1291: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<UInt8, UInt8, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
            .apply(StandardClassType<UInt8, UInt8, Bool>(), [GenericStructWith2TypeParameters<UInt8, UInt8>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#1292: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt8, UInt8, Bool>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#1293: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt8, UInt8, Bool>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [])
            @Expect("assertion#1294: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1295: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [])
            @Expect("assertion#1296: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [])
            @Expect("assertion#1297: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1298: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [])
            @Expect("assertion#1299: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(),
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#1300: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#1301: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#1302: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(StandardClassType<UInt8, UInt8, Bool>(), [()])
            @Expect("assertion#1303: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1304: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_45")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1305: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }
}
