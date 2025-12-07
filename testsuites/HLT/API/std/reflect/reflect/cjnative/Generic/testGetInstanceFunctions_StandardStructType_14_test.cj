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
class testGetInstanceFunctions_StandardStructType_14 {
    @TestCase
    func TestCase_174(): Unit {
        // logger.info("testcase TestCase_174 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, UInt16, Int32>>().getInstanceFunctions("classInstanceMemberFunction_175").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, UInt16, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
            .apply(StandardStructType<UInt8, UInt16, Int32>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()],
                [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5458: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5459: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5460: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5461: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5462: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5463: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5464: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5465: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5466: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5467: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5468: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5469: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5470: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#5471: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5472: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5473: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5474: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5475: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5476: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5477: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5478: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5479: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [])
            @Expect("assertion#5480: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5481: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [])
            @Expect("assertion#5482: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [])
            @Expect("assertion#5483: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5484: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [])
            @Expect("assertion#5485: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5486: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5487: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5488: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [()])
            @Expect("assertion#5489: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5490: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5491: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_174 ends.")
    }

    @TestCase
    func TestCase_175(): Unit {
        // logger.info("testcase TestCase_175 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt64, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_176").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt64, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
            .apply(StandardStructType<Unit, UInt64, UInt16>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()],
                [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#5492: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#5493: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5494: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5495: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5496: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5497: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt16>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#5498: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5499: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#5500: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#5501: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#5502: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#5503: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#5504: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#5505: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#5506: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt16>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#5507: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt16>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#5508: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#5509: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5510: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt16>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#5511: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#5512: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#5513: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt16>(), [])
            @Expect("assertion#5514: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5515: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply("hello", [])
            @Expect("assertion#5516: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt16>(), [])
            @Expect("assertion#5517: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5518: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply("hello", [])
            @Expect("assertion#5519: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt16>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#5520: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#5521: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#5522: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt16>(), [()])
            @Expect("assertion#5523: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5524: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_176")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5525: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_175 ends.")
    }

    @TestCase
    func TestCase_176(): Unit {
        // logger.info("testcase TestCase_176 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Bool, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_177").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Bool, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
            .apply(StandardStructType<UInt16, Bool, UInt8>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()],
                [GenericClassWith1TypeParameters<UInt16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#5526: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#5527: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5528: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5529: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5530: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5531: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5532: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5533: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#5534: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#5535: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#5536: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#5537: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#5538: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#5539: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#5540: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5541: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5542: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#5543: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5544: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#5545: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#5546: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#5547: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [])
            @Expect("assertion#5548: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5549: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply("hello", [])
            @Expect("assertion#5550: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [])
            @Expect("assertion#5551: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5552: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply("hello", [])
            @Expect("assertion#5553: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#5554: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#5555: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#5556: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [()])
            @Expect("assertion#5557: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5558: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_177")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5559: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_176 ends.")
    }

    @TestCase
    func TestCase_177(): Unit {
        // logger.info("testcase TestCase_177 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, UInt64, Int64>>().getInstanceFunctions("classInstanceMemberFunction_178").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, UInt64, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
            .apply(StandardStructType<UInt64, UInt64, Int64>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>()],
                [GenericClassWith1TypeParameters<UInt64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#5560: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#5561: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5562: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5563: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5564: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5565: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5566: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5567: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#5568: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#5569: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#5570: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#5571: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#5572: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#5573: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#5574: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5575: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5576: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#5577: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5578: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#5579: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#5580: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#5581: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [])
            @Expect("assertion#5582: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5583: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [])
            @Expect("assertion#5584: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [])
            @Expect("assertion#5585: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5586: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [])
            @Expect("assertion#5587: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(),
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#5588: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#5589: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#5590: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [()])
            @Expect("assertion#5591: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5592: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5593: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_177 ends.")
    }

    @TestCase
    func TestCase_178(): Unit {
        // logger.info("testcase TestCase_178 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, UInt16, Bool>>().getInstanceFunctions("classInstanceMemberFunction_179").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, UInt16, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
            .apply(StandardStructType<Int64, UInt16, Bool>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()],
                [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5595: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5596: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5597: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello",
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5598: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5599: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5600: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5601: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5602: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5603: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5604: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#5605: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#5606: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#5607: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5608: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5610: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5611: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5612: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5613: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5614: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5615: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [])
            @Expect("assertion#5616: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5617: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [])
            @Expect("assertion#5618: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [])
            @Expect("assertion#5619: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5620: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [])
            @Expect("assertion#5621: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5622: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5623: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5624: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [()])
            @Expect("assertion#5625: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5626: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5627: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_178 ends.")
    }
}
