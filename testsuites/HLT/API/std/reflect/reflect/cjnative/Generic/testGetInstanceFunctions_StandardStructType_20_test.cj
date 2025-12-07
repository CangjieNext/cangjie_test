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
class testGetInstanceFunctions_StandardStructType_20 {
    @TestCase
    func TestCase_204(): Unit {
        // logger.info("testcase TestCase_204 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, Bool, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_205").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, Bool, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
            .apply(StandardStructType<Unit, Bool, UInt16>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                [GenericStructWith1TypeParameters<Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6478: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6479: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6480: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6481: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6482: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6483: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6484: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6485: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6486: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6487: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6488: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#6489: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#6490: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#6491: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6492: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6493: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6494: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6495: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6496: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6497: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6498: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6499: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [])
            @Expect("assertion#6500: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6501: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [])
            @Expect("assertion#6502: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [])
            @Expect("assertion#6503: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6504: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [])
            @Expect("assertion#6505: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6506: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6507: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6508: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [()])
            @Expect("assertion#6509: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6510: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6511: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_204 ends.")
    }

    @TestCase
    func TestCase_205(): Unit {
        // logger.info("testcase TestCase_205 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Float32, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_206").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Float32, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
            .apply(StandardStructType<Bool, Float32, UInt8>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                [GenericStructWith1TypeParameters<UInt8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#6512: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#6513: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6514: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6515: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6516: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6517: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#6518: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6519: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#6520: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#6521: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#6522: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6523: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6524: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#6525: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#6526: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#6527: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6528: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#6529: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6530: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#6531: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#6532: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#6533: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [])
            @Expect("assertion#6534: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6535: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [])
            @Expect("assertion#6536: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [])
            @Expect("assertion#6537: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6538: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [])
            @Expect("assertion#6539: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(),
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#6540: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#6541: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#6542: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [()])
            @Expect("assertion#6543: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6544: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6545: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_205 ends.")
    }

    @TestCase
    func TestCase_206(): Unit {
        // logger.info("testcase TestCase_206 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, UInt16, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_207").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, UInt16, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
            .apply(StandardStructType<UInt16, UInt16, UInt16>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6546: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6547: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6548: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(StandardStructType<UInt16, UInt16, UInt16>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6549: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6550: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6551: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(StandardStructType<UInt16, UInt16, UInt16>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6552: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6553: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6554: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6555: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(StandardStructType<UInt16, UInt16, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6556: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(StandardStructType<UInt16, UInt16, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#6557: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#6558: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#6559: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(StandardStructType<UInt16, UInt16, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6560: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(StandardStructType<UInt16, UInt16, UInt16>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6561: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(StandardStructType<UInt16, UInt16, UInt16>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6562: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(StandardStructType<UInt16, UInt16, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6563: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(StandardStructType<UInt16, UInt16, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6564: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(StandardStructType<UInt16, UInt16, UInt16>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6565: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6566: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6567: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(StandardStructType<UInt16, UInt16, UInt16>(), [])
            @Expect("assertion#6568: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6569: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply("hello", [])
            @Expect("assertion#6570: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(StandardStructType<UInt16, UInt16, UInt16>(), [])
            @Expect("assertion#6571: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6572: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply("hello", [])
            @Expect("assertion#6573: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(StandardStructType<UInt16, UInt16, UInt16>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6574: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6575: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6576: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(StandardStructType<UInt16, UInt16, UInt16>(), [()])
            @Expect("assertion#6577: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6578: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_207")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6579: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_206 ends.")
    }

    @TestCase
    func TestCase_207(): Unit {
        // logger.info("testcase TestCase_207 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt32, Int16>>().getInstanceFunctions("classInstanceMemberFunction_208").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, UInt32, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
            .apply(StandardStructType<Bool, UInt32, Int16>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                [GenericStructWith1TypeParameters<Int16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#6580: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#6581: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6582: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6583: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6584: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6585: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6586: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6587: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#6588: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#6589: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#6590: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#6591: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#6592: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6593: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#6594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6595: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6596: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#6597: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6598: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#6599: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#6600: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#6601: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [])
            @Expect("assertion#6602: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6603: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [])
            @Expect("assertion#6604: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [])
            @Expect("assertion#6605: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6606: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [])
            @Expect("assertion#6607: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(),
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#6608: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#6609: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#6610: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(StandardStructType<Bool, UInt32, Int16>(), [()])
            @Expect("assertion#6611: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6612: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_208")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6613: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_207 ends.")
    }

    @TestCase
    func TestCase_208(): Unit {
        // logger.info("testcase TestCase_208 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Float32, Int16>>().getInstanceFunctions("classInstanceMemberFunction_209").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, Float32, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
            .apply(StandardStructType<Float32, Float32, Int16>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()],
                [GenericStructWith1TypeParameters<Int32>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#6614: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#6615: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6616: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(StandardStructType<Float32, Float32, Int16>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6617: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6618: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6619: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(StandardStructType<Float32, Float32, Int16>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [])
            @Expect("assertion#6620: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6621: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#6622: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#6623: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(StandardStructType<Float32, Float32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#6624: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(StandardStructType<Float32, Float32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#6625: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#6626: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#6627: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(StandardStructType<Float32, Float32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#6628: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(StandardStructType<Float32, Float32, Int16>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [])
            @Expect("assertion#6629: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(StandardStructType<Float32, Float32, Int16>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6630: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(StandardStructType<Float32, Float32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#6631: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(StandardStructType<Float32, Float32, Int16>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6632: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(StandardStructType<Float32, Float32, Int16>(), [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#6633: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#6634: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#6635: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(StandardStructType<Float32, Float32, Int16>(), [])
            @Expect("assertion#6636: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6637: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply("hello", [])
            @Expect("assertion#6638: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(StandardStructType<Float32, Float32, Int16>(), [])
            @Expect("assertion#6639: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6640: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply("hello", [])
            @Expect("assertion#6641: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(StandardStructType<Float32, Float32, Int16>(),
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#6642: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#6643: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#6644: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(StandardStructType<Float32, Float32, Int16>(), [()])
            @Expect("assertion#6645: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6646: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Float32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_209")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6647: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_208 ends.")
    }
}
