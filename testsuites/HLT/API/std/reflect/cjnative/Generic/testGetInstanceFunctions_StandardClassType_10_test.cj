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
class testGetInstanceFunctions_StandardClassType_10 {
    @TestCase
    func TestCase_45(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Int8, Float32>>().getInstanceFunctions("classInstanceMemberFunction_46").size)
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#1306: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#1307: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1308: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1309: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1310: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#1311: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#1312: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#1313: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [], [()])
            @Expect("assertion#1314: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1315: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#1316: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#1317: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#1318: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#1319: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#1320: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<UInt16, Int8, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
            .apply(StandardClassType<UInt16, Int8, Float32>(), [GenericStructWith2TypeParameters<Float32, Float32>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#1321: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt16, Int8, Float32>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#1322: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardClassType<UInt16, Int8, Float32>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [])
            @Expect("assertion#1323: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1324: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [])
            @Expect("assertion#1325: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [])
            @Expect("assertion#1326: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1327: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [])
            @Expect("assertion#1328: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(),
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#1329: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#1330: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#1331: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(StandardClassType<UInt16, Int8, Float32>(), [()])
            @Expect("assertion#1332: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1333: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_46")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1334: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_46(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int8, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_47").size)
        TypeInfo
            .of<StandardClassType<UInt64, Int8, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
            .apply(StandardClassType<UInt64, Int8, UInt32>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64])
            @Expect("assertion#1335: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [123i64])
            @Expect("assertion#1336: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1337: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1338: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1339: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1340: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#1341: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1342: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64, 114.514000f64])
            @Expect("assertion#1343: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [123i64, 114.514000f64])
            @Expect("assertion#1344: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#1345: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#1346: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#1347: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#1348: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#1349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#1350: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1351: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64, 114.514000f64])
            @Expect("assertion#1352: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#1353: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [123i64])
            @Expect("assertion#1354: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#1355: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#1356: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [])
            @Expect("assertion#1357: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1358: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [])
            @Expect("assertion#1359: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [])
            @Expect("assertion#1360: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1361: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [])
            @Expect("assertion#1362: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [123i64, 114.514000f64])
            @Expect("assertion#1363: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#1364: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#1365: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [114.514000f64])
            @Expect("assertion#1366: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#1367: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#1368: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_47(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Float64, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_48").size)
        TypeInfo
            .of<StandardClassType<UInt64, Float64, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
            .apply(StandardClassType<UInt64, Float64, UInt32>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [true])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [true])
            @Expect("assertion#1369: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [true])
            @Expect("assertion#1370: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1371: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1372: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello",
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1373: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1374: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1375: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1376: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [true, 114.514000f64])
            @Expect("assertion#1377: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [true, 114.514000f64])
            @Expect("assertion#1378: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [true, 114.514000f64])
            @Expect("assertion#1379: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1380: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1381: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#1382: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [true])
            @Expect("assertion#1383: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1384: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1385: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [true, 114.514000f64])
            @Expect("assertion#1386: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1387: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [true])
            @Expect("assertion#1388: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [true])
            @Expect("assertion#1389: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [true])
            @Expect("assertion#1390: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [])
            @Expect("assertion#1391: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1392: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [])
            @Expect("assertion#1393: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [])
            @Expect("assertion#1394: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1395: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [])
            @Expect("assertion#1396: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [true, 114.514000f64])
            @Expect("assertion#1397: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [true, 114.514000f64])
            @Expect("assertion#1398: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [true, 114.514000f64])
            @Expect("assertion#1399: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(StandardClassType<UInt64, Float64, UInt32>(), [()])
            @Expect("assertion#1400: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1401: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_48")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1402: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_48(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, Bool, Float64>>().getInstanceFunctions("classInstanceMemberFunction_49").size)
        TypeInfo
            .of<StandardClassType<Float64, Bool, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
            .apply(StandardClassType<Float64, Bool, Float64>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [()])
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1403: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#1404: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#1405: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#1406: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1407: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#1408: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#1409: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1410: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#1411: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [(), 114.514000f64])
            @Expect("assertion#1412: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [(), 114.514000f64])
            @Expect("assertion#1413: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#1414: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#1415: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [123i64])
            @Expect("assertion#1416: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1417: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#1418: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#1419: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#1420: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#1421: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [()])
            @Expect("assertion#1422: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1423: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1424: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [])
            @Expect("assertion#1425: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1426: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [])
            @Expect("assertion#1427: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [])
            @Expect("assertion#1428: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1429: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [])
            @Expect("assertion#1430: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [(), 114.514000f64])
            @Expect("assertion#1431: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [(), 114.514000f64])
            @Expect("assertion#1432: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [(), 114.514000f64])
            @Expect("assertion#1433: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(StandardClassType<Float64, Bool, Float64>(), [123i64])
            @Expect("assertion#1434: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#1435: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Bool, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_49")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#1436: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_49(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int8, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_50").size)
        TypeInfo
            .of<StandardClassType<UInt64, Int8, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
            .apply(StandardClassType<UInt64, Int8, UInt64>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [123u64])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [123u64])
            @Expect("assertion#1437: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [123u64])
            @Expect("assertion#1438: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1439: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1440: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1441: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1442: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#1443: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1444: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [123u64, 114.514000f64])
            @Expect("assertion#1445: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [123u64, 114.514000f64])
            @Expect("assertion#1446: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [123u64, 114.514000f64])
            @Expect("assertion#1447: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#1448: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#1449: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#1450: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [123u64])
            @Expect("assertion#1451: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#1452: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1453: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [123u64, 114.514000f64])
            @Expect("assertion#1454: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#1455: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [123u64])
            @Expect("assertion#1456: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [123u64])
            @Expect("assertion#1457: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [123u64])
            @Expect("assertion#1458: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [])
            @Expect("assertion#1459: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1460: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [])
            @Expect("assertion#1461: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [])
            @Expect("assertion#1462: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1463: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [])
            @Expect("assertion#1464: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [123u64, 114.514000f64])
            @Expect("assertion#1465: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [123u64, 114.514000f64])
            @Expect("assertion#1466: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [123u64, 114.514000f64])
            @Expect("assertion#1467: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt64>(), [114.514000f64])
            @Expect("assertion#1468: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#1469: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_50")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#1470: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
