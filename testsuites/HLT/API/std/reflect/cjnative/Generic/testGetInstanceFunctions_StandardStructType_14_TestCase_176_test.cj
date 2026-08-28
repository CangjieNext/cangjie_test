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
}
