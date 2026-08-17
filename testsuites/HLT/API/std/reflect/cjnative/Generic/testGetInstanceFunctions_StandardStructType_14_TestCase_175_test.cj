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
class testGetInstanceFunctions_StandardStructType_14 {
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
}
