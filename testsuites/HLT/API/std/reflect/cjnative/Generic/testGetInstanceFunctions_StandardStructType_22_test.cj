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
class testGetInstanceFunctions_StandardStructType_22 {
    @TestCase
    func TestCase_214(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt32, Int64>>().getInstanceFunctions("classInstanceMemberFunction_215").size)
        TypeInfo
            .of<StandardStructType<Unit, UInt32, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
            .apply(StandardStructType<Unit, UInt32, Int64>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>()],
                [GenericStructWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6818: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6819: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6820: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6821: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6822: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6823: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6824: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6825: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6826: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6827: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6828: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6829: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6830: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6831: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6832: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6833: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6834: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6835: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6836: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6837: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6838: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6839: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [])
            @Expect("assertion#6840: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6841: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [])
            @Expect("assertion#6842: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [])
            @Expect("assertion#6843: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6844: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [])
            @Expect("assertion#6845: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6846: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6847: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6848: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [()])
            @Expect("assertion#6849: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6850: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6851: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_215(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, UInt8, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_216").size)
        TypeInfo
            .of<StandardStructType<UInt8, UInt8, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
            .apply(StandardStructType<UInt8, UInt8, UInt16>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()],
                [GenericStructWith2TypeParameters<Float64, Float64>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#6852: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#6853: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6854: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6855: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6856: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6857: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6858: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6859: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#6860: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#6861: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#6862: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#6863: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#6864: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6865: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#6866: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6867: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6868: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#6869: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6870: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(),
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#6871: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#6872: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#6873: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(), [])
            @Expect("assertion#6874: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6875: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [])
            @Expect("assertion#6876: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(), [])
            @Expect("assertion#6877: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6878: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [])
            @Expect("assertion#6879: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(),
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#6880: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#6881: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#6882: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(), [()])
            @Expect("assertion#6883: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6884: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6885: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_216(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int16, Int8>>().getInstanceFunctions("classInstanceMemberFunction_217").size)
        TypeInfo
            .of<StandardStructType<Bool, Int16, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
            .apply(StandardStructType<Bool, Int16, Int8>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                [GenericStructWith2TypeParameters<UInt32, UInt32>()])
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#6886: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#6887: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6888: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6889: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6890: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6891: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6892: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6893: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#6894: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#6895: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#6896: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6897: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6898: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6899: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#6900: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6901: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6902: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#6903: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6904: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#6905: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#6906: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#6907: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [])
            @Expect("assertion#6908: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6909: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [])
            @Expect("assertion#6910: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [])
            @Expect("assertion#6911: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6912: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [])
            @Expect("assertion#6913: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(),
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#6914: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#6915: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#6916: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [()])
            @Expect("assertion#6917: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6918: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6919: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_217(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int64, Int64>>().getInstanceFunctions("classInstanceMemberFunction_218").size)
        TypeInfo
            .of<StandardStructType<Bool, Int64, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
            .apply(StandardStructType<Bool, Int64, Int64>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                [GenericStructWith2TypeParameters<UInt16, UInt16>()])
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#6920: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#6921: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6922: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(StandardStructType<Bool, Int64, Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6923: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6924: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6925: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(StandardStructType<Bool, Int64, Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6926: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6927: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#6928: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#6929: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(StandardStructType<Bool, Int64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#6930: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(StandardStructType<Bool, Int64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#6931: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#6932: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#6933: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(StandardStructType<Bool, Int64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#6934: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(StandardStructType<Bool, Int64, Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6935: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(StandardStructType<Bool, Int64, Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6936: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(StandardStructType<Bool, Int64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#6937: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(StandardStructType<Bool, Int64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6938: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(StandardStructType<Bool, Int64, Int64>(), [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#6939: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#6940: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#6941: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(StandardStructType<Bool, Int64, Int64>(), [])
            @Expect("assertion#6942: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6943: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply("hello", [])
            @Expect("assertion#6944: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(StandardStructType<Bool, Int64, Int64>(), [])
            @Expect("assertion#6945: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6946: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply("hello", [])
            @Expect("assertion#6947: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(StandardStructType<Bool, Int64, Int64>(),
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#6948: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#6949: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#6950: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(StandardStructType<Bool, Int64, Int64>(), [()])
            @Expect("assertion#6951: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6952: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_218")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6953: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
