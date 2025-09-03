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
class testGetInstanceFunctions_StandardStructType_21 {
    @TestCase
    func TestCase_209(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_210").size)
        TypeInfo
            .of<StandardStructType<Int32, Int64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
            .apply(StandardStructType<Int32, Int64, Float32>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                [GenericStructWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6648: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6649: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6650: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6651: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6652: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6653: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6654: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6655: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6656: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6657: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6658: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6659: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6660: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#6661: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6662: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6663: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6664: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6665: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6666: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6667: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6668: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6669: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [])
            @Expect("assertion#6670: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6671: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [])
            @Expect("assertion#6672: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [])
            @Expect("assertion#6673: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6674: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [])
            @Expect("assertion#6675: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6676: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6677: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6678: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [()])
            @Expect("assertion#6679: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6680: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6681: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_210(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Float64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_211").size)
        TypeInfo
            .of<StandardStructType<UInt8, Float64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
            .apply(StandardStructType<UInt8, Float64, Float32>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                [GenericStructWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#6682: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#6683: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6684: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6685: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6686: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6687: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6688: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6689: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#6690: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#6691: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#6692: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6693: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6694: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#6695: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#6696: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6697: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6698: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#6699: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6700: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#6701: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#6702: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#6703: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [])
            @Expect("assertion#6704: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6705: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [])
            @Expect("assertion#6706: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [])
            @Expect("assertion#6707: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6708: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [])
            @Expect("assertion#6709: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#6710: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#6711: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#6712: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [()])
            @Expect("assertion#6713: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6714: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6715: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_211(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, UInt16, Int32>>().getInstanceFunctions("classInstanceMemberFunction_212").size)
        TypeInfo
            .of<StandardStructType<Int64, UInt16, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
            .apply(StandardStructType<Int64, UInt16, Int32>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6716: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6717: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#6718: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#6719: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6720: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#6721: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6722: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6723: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6724: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6725: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6726: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#6727: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#6728: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#6729: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6730: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6731: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#6732: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6733: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6734: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6735: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6736: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6737: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [])
            @Expect("assertion#6738: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6739: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [])
            @Expect("assertion#6740: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [])
            @Expect("assertion#6741: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6742: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [])
            @Expect("assertion#6743: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6744: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6745: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6746: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [()])
            @Expect("assertion#6747: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6748: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6749: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_212(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Int64, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_213").size)
        TypeInfo
            .of<StandardStructType<Float32, Int64, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
            .apply(StandardStructType<Float32, Int64, UInt16>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                [GenericStructWith2TypeParameters<Float32, Float32>()])
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#6750: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#6751: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6752: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6753: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6754: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6755: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6756: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6757: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#6758: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#6759: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#6760: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6761: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6762: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6763: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#6764: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6765: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6766: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#6767: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6768: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(),
                    [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#6769: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#6770: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#6771: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(), [])
            @Expect("assertion#6772: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6773: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [])
            @Expect("assertion#6774: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(), [])
            @Expect("assertion#6775: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6776: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [])
            @Expect("assertion#6777: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(),
                    [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#6778: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#6779: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#6780: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(), [()])
            @Expect("assertion#6781: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6782: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6783: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_213(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_214").size)
        TypeInfo
            .of<StandardStructType<Int8, Int8, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
            .apply(StandardStructType<Int8, Int8, UInt8>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                [GenericStructWith2TypeParameters<Int8, Int8>()])
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#6784: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#6785: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6786: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6787: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6788: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6789: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6790: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6791: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#6792: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#6793: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#6794: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6795: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6796: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6797: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#6798: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6799: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6800: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#6801: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6802: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [GenericStructWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#6803: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#6804: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#6805: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [])
            @Expect("assertion#6806: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6807: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [])
            @Expect("assertion#6808: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [])
            @Expect("assertion#6809: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6810: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [])
            @Expect("assertion#6811: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(),
                    [GenericStructWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#6812: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#6813: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#6814: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [()])
            @Expect("assertion#6815: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6816: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6817: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
