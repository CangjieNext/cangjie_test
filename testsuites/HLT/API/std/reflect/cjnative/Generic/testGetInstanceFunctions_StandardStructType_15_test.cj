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
class testGetInstanceFunctions_StandardStructType_15 {
    @TestCase
    func TestCase_179(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Float64, Int16>>().getInstanceFunctions("classInstanceMemberFunction_180").size)
        TypeInfo
            .of<StandardStructType<Float32, Float64, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
            .apply(StandardStructType<Float32, Float64, Int16>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                [GenericClassWith1TypeParameters<Float64>()])
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5628: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5629: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5630: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5631: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5632: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5633: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5634: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5635: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5636: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5637: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5638: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#5639: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#5640: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#5641: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5642: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5643: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5644: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5645: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5646: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5647: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5648: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5649: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [])
            @Expect("assertion#5650: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5651: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [])
            @Expect("assertion#5652: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [])
            @Expect("assertion#5653: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5654: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [])
            @Expect("assertion#5655: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(),
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5656: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5657: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5658: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(StandardStructType<Float32, Float64, Int16>(), [()])
            @Expect("assertion#5659: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5660: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_180")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5661: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_180(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, UInt8, Unit>>().getInstanceFunctions("classInstanceMemberFunction_181").size)
        TypeInfo
            .of<StandardStructType<Float64, UInt8, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
            .apply(StandardStructType<Float64, UInt8, Unit>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()],
                [GenericClassWith1TypeParameters<Float64>()])
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5662: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5663: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5664: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5665: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5666: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5667: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5668: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5669: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5670: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5671: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5672: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#5673: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#5674: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5675: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5676: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5677: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5678: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5679: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5680: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5681: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5682: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5683: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [])
            @Expect("assertion#5684: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5685: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [])
            @Expect("assertion#5686: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [])
            @Expect("assertion#5687: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5688: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [])
            @Expect("assertion#5689: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(),
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5690: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5691: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5692: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [()])
            @Expect("assertion#5693: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5694: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5695: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_181(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int16, Float64>>().getInstanceFunctions("classInstanceMemberFunction_182").size)
        TypeInfo
            .of<StandardStructType<Bool, Int16, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
            .apply(StandardStructType<Bool, Int16, Float64>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()],
                [GenericClassWith1TypeParameters<Int16>()])
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#5696: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#5697: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5698: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5699: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5700: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5701: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5702: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5703: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#5704: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#5705: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#5706: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#5707: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#5708: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#5709: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#5710: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5711: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5712: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#5713: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5714: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#5715: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#5716: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#5717: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [])
            @Expect("assertion#5718: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5719: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [])
            @Expect("assertion#5720: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [])
            @Expect("assertion#5721: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5722: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [])
            @Expect("assertion#5723: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(),
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#5724: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#5725: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#5726: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [()])
            @Expect("assertion#5727: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5728: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5729: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_182(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, UInt64, Int64>>().getInstanceFunctions("classInstanceMemberFunction_183").size)
        TypeInfo
            .of<StandardStructType<Int32, UInt64, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
            .apply(StandardStructType<Int32, UInt64, Int64>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()],
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5730: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5731: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5732: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5733: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5734: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5735: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5736: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5737: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5738: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5739: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5740: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#5741: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#5742: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5743: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5744: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5745: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5746: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5747: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5748: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5749: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5750: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#5751: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int64>(), [])
            @Expect("assertion#5752: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5753: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply("hello", [])
            @Expect("assertion#5754: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int64>(), [])
            @Expect("assertion#5755: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5756: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply("hello", [])
            @Expect("assertion#5757: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int64>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5758: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5759: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#5760: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(StandardStructType<Int32, UInt64, Int64>(), [()])
            @Expect("assertion#5761: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5762: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_183")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5763: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_183(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Float32, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_184").size)
        TypeInfo
            .of<StandardStructType<UInt16, Float32, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
            .apply(StandardStructType<UInt16, Float32, UInt16>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()],
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5764: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5765: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5766: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(StandardStructType<UInt16, Float32, UInt16>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5767: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5768: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5769: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(StandardStructType<UInt16, Float32, UInt16>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5770: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5771: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5772: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5773: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(StandardStructType<UInt16, Float32, UInt16>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5774: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(StandardStructType<UInt16, Float32, UInt16>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#5775: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#5776: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#5777: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(StandardStructType<UInt16, Float32, UInt16>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5778: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(StandardStructType<UInt16, Float32, UInt16>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5779: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(StandardStructType<UInt16, Float32, UInt16>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5780: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(StandardStructType<UInt16, Float32, UInt16>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5781: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(StandardStructType<UInt16, Float32, UInt16>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5782: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(StandardStructType<UInt16, Float32, UInt16>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5783: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5784: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5785: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(StandardStructType<UInt16, Float32, UInt16>(), [])
            @Expect("assertion#5786: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5787: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply("hello", [])
            @Expect("assertion#5788: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(StandardStructType<UInt16, Float32, UInt16>(), [])
            @Expect("assertion#5789: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5790: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply("hello", [])
            @Expect("assertion#5791: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(StandardStructType<UInt16, Float32, UInt16>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5792: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5793: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5794: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(StandardStructType<UInt16, Float32, UInt16>(), [()])
            @Expect("assertion#5795: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5796: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_184")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5797: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
