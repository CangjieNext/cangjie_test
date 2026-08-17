/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// EXEC: %compiler %cmp_opt %compile_library dependency/*.cj -o libdependency.%library_suffix
// EXEC: %compiler %cmp_opt -L. -ldependency %f %cmp_utest_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args  
package testsuite

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*

@Test
class testGetInstanceFunctions_StandardStructType_22 {
    @TestCase
    func TestCase_215(): Unit {
        // logger.info("testcase TestCase_215 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, UInt8, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_216").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, UInt8, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
            .apply(StandardStructType<UInt8, UInt8, UInt16>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()],
                [GenericStructWith2TypeParameters<Float64, Float64>()])
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6854: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6855: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6857: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6858: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型检查失败")
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
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#6864: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6865: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6867: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6868: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("函数为泛型，类型形参列表未指定")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#6872: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#6873: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(), [])
            @Expect("assertion#6874: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6875: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [])
            @Expect("assertion#6876: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(), [])
            @Expect("assertion#6877: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6878: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [])
            @Expect("assertion#6879: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#6881: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#6882: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(StandardStructType<UInt8, UInt8, UInt16>(), [()])
            @Expect("assertion#6883: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6884: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_216")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6885: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_215 ends.")
    }
}
