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
class testGetInstanceFunctions_StandardStructType_11 {
    @TestCase
    func TestCase_159(): Unit {
        // logger.info("testcase TestCase_159 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Int64, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_160").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Int64, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
            .apply(StandardStructType<UInt8, Int64, UInt8>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [123i64])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [123i64])
            @Expect("assertion#4948: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [123i64])
            @Expect("assertion#4949: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#4950: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#4951: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#4952: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#4953: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#4954: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#4955: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [123i64, 114.514000f64])
            @Expect("assertion#4956: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [123i64, 114.514000f64])
            @Expect("assertion#4957: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#4958: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#4959: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#4960: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#4961: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#4962: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#4963: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#4964: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [123i64, 114.514000f64])
            @Expect("assertion#4965: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#4966: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [123i64])
            @Expect("assertion#4967: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#4968: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#4969: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [])
            @Expect("assertion#4970: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4971: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [])
            @Expect("assertion#4972: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [])
            @Expect("assertion#4973: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4974: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [])
            @Expect("assertion#4975: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [123i64, 114.514000f64])
            @Expect("assertion#4976: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#4977: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#4978: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(StandardStructType<UInt8, Int64, UInt8>(), [114.514000f64])
            @Expect("assertion#4979: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#4980: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_160")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#4981: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_159 ends.")
    }

    @TestCase
    func TestCase_160(): Unit {
        // logger.info("testcase TestCase_160 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int32, Int16>>().getInstanceFunctions("classInstanceMemberFunction_161").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Int32, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
            .apply(StandardStructType<Float64, Int32, Int16>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [1i16])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [1i16])
            @Expect("assertion#4982: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [1i16])
            @Expect("assertion#4983: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#4984: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#4985: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#4986: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#4987: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#4988: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#4989: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [1i16, 114.514000f64])
            @Expect("assertion#4990: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [1i16, 114.514000f64])
            @Expect("assertion#4991: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [1i16, 114.514000f64])
            @Expect("assertion#4992: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#4993: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#4994: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#4995: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [1i16])
            @Expect("assertion#4996: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#4997: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#4998: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [1i16, 114.514000f64])
            @Expect("assertion#4999: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#5000: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [1i16])
            @Expect("assertion#5001: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [1i16])
            @Expect("assertion#5002: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [1i16])
            @Expect("assertion#5003: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [])
            @Expect("assertion#5004: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5005: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [])
            @Expect("assertion#5006: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [])
            @Expect("assertion#5007: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5008: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [])
            @Expect("assertion#5009: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [1i16, 114.514000f64])
            @Expect("assertion#5010: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [1i16, 114.514000f64])
            @Expect("assertion#5011: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [1i16, 114.514000f64])
            @Expect("assertion#5012: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(StandardStructType<Float64, Int32, Int16>(), [114.514000f64])
            @Expect("assertion#5013: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#5014: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_161")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#5015: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_160 ends.")
    }

    @TestCase
    func TestCase_161(): Unit {
        // logger.info("testcase TestCase_161 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Unit, Float64>>().getInstanceFunctions("classInstanceMemberFunction_162").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, Unit, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
            .apply(StandardStructType<Float32, Unit, Float64>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [1u16])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [1u16])
            @Expect("assertion#5016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [1u16])
            @Expect("assertion#5017: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5018: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5019: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5020: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5021: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5022: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5023: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [1u16, 114.514000f64])
            @Expect("assertion#5024: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [1u16, 114.514000f64])
            @Expect("assertion#5025: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [1u16, 114.514000f64])
            @Expect("assertion#5026: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#5027: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#5028: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#5029: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [1u16])
            @Expect("assertion#5030: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#5031: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5032: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [1u16, 114.514000f64])
            @Expect("assertion#5033: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#5034: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [1u16])
            @Expect("assertion#5035: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [1u16])
            @Expect("assertion#5036: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [1u16])
            @Expect("assertion#5037: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [])
            @Expect("assertion#5038: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5039: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [])
            @Expect("assertion#5040: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [])
            @Expect("assertion#5041: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5042: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [])
            @Expect("assertion#5043: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [1u16, 114.514000f64])
            @Expect("assertion#5044: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [1u16, 114.514000f64])
            @Expect("assertion#5045: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [1u16, 114.514000f64])
            @Expect("assertion#5046: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(StandardStructType<Float32, Unit, Float64>(), [114.514000f64])
            @Expect("assertion#5047: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#5048: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Unit, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_162")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#5049: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_161 ends.")
    }

    @TestCase
    func TestCase_162(): Unit {
        // logger.info("testcase TestCase_162 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, Int32, Int64>>().getInstanceFunctions("classInstanceMemberFunction_163").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, Int32, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
            .apply(StandardStructType<Unit, Int32, Int64>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [123i64])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [123i64])
            @Expect("assertion#5050: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [123i64])
            @Expect("assertion#5051: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5052: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(StandardStructType<Unit, Int32, Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5053: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5054: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5055: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(StandardStructType<Unit, Int32, Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5056: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5057: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [123i64, 114.514000f64])
            @Expect("assertion#5058: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [123i64, 114.514000f64])
            @Expect("assertion#5059: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(StandardStructType<Unit, Int32, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#5060: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(StandardStructType<Unit, Int32, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#5061: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#5062: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#5063: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(StandardStructType<Unit, Int32, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#5064: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(StandardStructType<Unit, Int32, Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5065: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(StandardStructType<Unit, Int32, Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5066: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(StandardStructType<Unit, Int32, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [123i64, 114.514000f64])
            @Expect("assertion#5067: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(StandardStructType<Unit, Int32, Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#5068: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(StandardStructType<Unit, Int32, Int64>(), [123i64])
            @Expect("assertion#5069: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#5070: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#5071: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(StandardStructType<Unit, Int32, Int64>(), [])
            @Expect("assertion#5072: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5073: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply("hello", [])
            @Expect("assertion#5074: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(StandardStructType<Unit, Int32, Int64>(), [])
            @Expect("assertion#5075: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5076: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply("hello", [])
            @Expect("assertion#5077: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(StandardStructType<Unit, Int32, Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#5078: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#5079: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#5080: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(StandardStructType<Unit, Int32, Int64>(), [114.514000f64])
            @Expect("assertion#5081: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#5082: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_163")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#5083: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_162 ends.")
    }

    @TestCase
    func TestCase_163(): Unit {
        // logger.info("testcase TestCase_163 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, UInt8, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_164").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, UInt8, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
            .apply(StandardStructType<Float64, UInt8, UInt64>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [1u32])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [1u32])
            @Expect("assertion#5084: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [1u32])
            @Expect("assertion#5085: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5086: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5087: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5088: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5089: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5090: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5091: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [1u32, 114.514000f64])
            @Expect("assertion#5092: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [1u32, 114.514000f64])
            @Expect("assertion#5093: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [1u32, 114.514000f64])
            @Expect("assertion#5094: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [114.514000f64])
            @Expect("assertion#5095: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [114.514000f64])
            @Expect("assertion#5096: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#5097: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [1u32])
            @Expect("assertion#5098: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5099: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5100: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [1u32, 114.514000f64])
            @Expect("assertion#5101: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#5102: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [1u32])
            @Expect("assertion#5103: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [1u32])
            @Expect("assertion#5104: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [1u32])
            @Expect("assertion#5105: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [])
            @Expect("assertion#5106: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5107: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [])
            @Expect("assertion#5108: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [])
            @Expect("assertion#5109: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5110: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [])
            @Expect("assertion#5111: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [1u32, 114.514000f64])
            @Expect("assertion#5112: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [1u32, 114.514000f64])
            @Expect("assertion#5113: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [1u32, 114.514000f64])
            @Expect("assertion#5114: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(StandardStructType<Float64, UInt8, UInt64>(), [114.514000f64])
            @Expect("assertion#5115: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#5116: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_164")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#5117: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_163 ends.")
    }
}
