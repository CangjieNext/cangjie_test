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
class testGetInstanceFunctions_StandardStructType_20 {
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
