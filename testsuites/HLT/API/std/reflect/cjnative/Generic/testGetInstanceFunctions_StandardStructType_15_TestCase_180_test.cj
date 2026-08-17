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
class testGetInstanceFunctions_StandardStructType_15 {
    @TestCase
    func TestCase_180(): Unit {
        // logger.info("testcase TestCase_180 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, UInt8, Unit>>().getInstanceFunctions("classInstanceMemberFunction_181").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, UInt8, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
            .apply(StandardStructType<Float64, UInt8, Unit>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()],
                [GenericClassWith1TypeParameters<Float64>()])
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5664: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5665: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5667: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5668: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型检查失败")
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
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#5674: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5675: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5677: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#5678: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5681: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5682: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#5683: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [])
            @Expect("assertion#5684: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5685: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [])
            @Expect("assertion#5686: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [])
            @Expect("assertion#5687: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5688: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [])
            @Expect("assertion#5689: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5691: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#5692: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(StandardStructType<Float64, UInt8, Unit>(), [()])
            @Expect("assertion#5693: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5694: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_181")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5695: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_180 ends.")
    }
}
