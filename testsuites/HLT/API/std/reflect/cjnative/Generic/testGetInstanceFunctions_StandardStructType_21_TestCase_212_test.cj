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
class testGetInstanceFunctions_StandardStructType_21 {
    @TestCase
    func TestCase_212(): Unit {
        // logger.info("testcase TestCase_212 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Int64, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_213").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, Int64, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
            .apply(StandardStructType<Float32, Int64, UInt16>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                [GenericStructWith2TypeParameters<Float32, Float32>()])
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6752: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6753: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6755: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6756: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型检查失败")
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
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6762: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6763: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6765: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6766: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("函数为泛型，类型形参列表未指定")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#6770: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#6771: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(), [])
            @Expect("assertion#6772: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6773: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [])
            @Expect("assertion#6774: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(), [])
            @Expect("assertion#6775: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6776: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [])
            @Expect("assertion#6777: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#6779: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#6780: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(StandardStructType<Float32, Int64, UInt16>(), [()])
            @Expect("assertion#6781: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6782: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_213")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6783: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_212 ends.")
    }
}
