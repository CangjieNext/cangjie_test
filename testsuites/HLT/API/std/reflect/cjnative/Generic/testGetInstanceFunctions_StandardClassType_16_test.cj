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
class testGetInstanceFunctions_StandardClassType_16 {
    @TestCase
    func TestCase_75(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, Float64, Int64>>().getInstanceFunctions("classInstanceMemberFunction_76").size)
        TypeInfo
            .of<StandardClassType<Int8, Float64, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
            .apply(StandardClassType<Int8, Float64, Int64>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#2321: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#2322: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2323: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2324: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2325: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2326: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2327: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2328: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#2329: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#2330: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#2331: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#2332: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#2333: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2334: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#2335: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2336: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2337: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#2338: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2339: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#2340: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#2341: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#2342: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [])
            @Expect("assertion#2343: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2344: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [])
            @Expect("assertion#2345: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [])
            @Expect("assertion#2346: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2347: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [])
            @Expect("assertion#2348: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#2349: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#2350: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#2351: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [()])
            @Expect("assertion#2352: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2353: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2354: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_76(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt8, Bool>>().getInstanceFunctions("classInstanceMemberFunction_77").size)
        TypeInfo
            .of<StandardClassType<Int64, UInt8, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
            .apply(StandardClassType<Int64, UInt8, Bool>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2355: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2356: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2357: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(StandardClassType<Int64, UInt8, Bool>(), [TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2358: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply("hello",
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2359: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2360: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(StandardClassType<Int64, UInt8, Bool>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2361: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2362: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2363: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2364: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(StandardClassType<Int64, UInt8, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2365: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(StandardClassType<Int64, UInt8, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2366: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2367: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2368: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(StandardClassType<Int64, UInt8, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2369: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(StandardClassType<Int64, UInt8, Bool>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2370: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(StandardClassType<Int64, UInt8, Bool>(), [TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2371: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(StandardClassType<Int64, UInt8, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2372: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(StandardClassType<Int64, UInt8, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2373: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(StandardClassType<Int64, UInt8, Bool>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2374: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2375: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2376: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(StandardClassType<Int64, UInt8, Bool>(), [])
            @Expect("assertion#2377: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2378: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply("hello", [])
            @Expect("assertion#2379: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(StandardClassType<Int64, UInt8, Bool>(), [])
            @Expect("assertion#2380: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2381: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply("hello", [])
            @Expect("assertion#2382: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(StandardClassType<Int64, UInt8, Bool>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2383: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2384: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2385: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(StandardClassType<Int64, UInt8, Bool>(), [()])
            @Expect("assertion#2386: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2387: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_77")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2388: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_77(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Bool, Int32>>().getInstanceFunctions("classInstanceMemberFunction_78").size)
        TypeInfo
            .of<StandardClassType<Float32, Bool, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
            .apply(StandardClassType<Float32, Bool, Int32>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2389: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2390: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2391: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2392: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2393: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2394: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#2395: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2396: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2397: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2398: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2399: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2400: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2401: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#2402: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2403: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#2404: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2405: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2406: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2407: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2408: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2409: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2410: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [])
            @Expect("assertion#2411: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2412: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [])
            @Expect("assertion#2413: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [])
            @Expect("assertion#2414: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2415: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [])
            @Expect("assertion#2416: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2417: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2418: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2419: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(StandardClassType<Float32, Bool, Int32>(), [()])
            @Expect("assertion#2420: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2421: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Bool, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_78")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2422: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_78(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Float32, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_79").size)
        TypeInfo
            .of<StandardClassType<Float32, Float32, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
            .apply(StandardClassType<Float32, Float32, UInt8>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                [GenericClassWith2TypeParameters<UInt8, UInt8>()])
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2423: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2424: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2425: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2426: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2427: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2428: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2429: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2430: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2431: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2432: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2433: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2434: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2435: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#2436: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2437: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2438: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2439: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2440: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2441: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2442: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2443: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#2444: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [])
            @Expect("assertion#2445: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2446: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [])
            @Expect("assertion#2447: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [])
            @Expect("assertion#2448: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2449: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [])
            @Expect("assertion#2450: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(),
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2451: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2452: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#2453: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(StandardClassType<Float32, Float32, UInt8>(), [()])
            @Expect("assertion#2454: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2455: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_79")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2456: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_79(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Int8, Float64>>().getInstanceFunctions("classInstanceMemberFunction_80").size)
        TypeInfo
            .of<StandardClassType<UInt8, Int8, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
            .apply(StandardClassType<UInt8, Int8, Float64>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                [GenericClassWith2TypeParameters<Float64, Float64>()])
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#2457: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#2458: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2459: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2460: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2461: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2462: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2463: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2464: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#2465: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#2466: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#2467: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#2468: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#2469: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#2470: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#2471: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2472: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2473: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#2474: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2475: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [GenericClassWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#2476: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#2477: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#2478: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [])
            @Expect("assertion#2479: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2480: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [])
            @Expect("assertion#2481: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [])
            @Expect("assertion#2482: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2483: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [])
            @Expect("assertion#2484: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(),
                    [GenericClassWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#2485: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#2486: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#2487: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(StandardClassType<UInt8, Int8, Float64>(), [()])
            @Expect("assertion#2488: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2489: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int8, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_80")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2490: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
