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
class testGetInstanceFunctions_StandardStructType_16 {
    @TestCase
    func TestCase_187(): Unit {
        // logger.info("testcase TestCase_187 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int8, Int8>>().getInstanceFunctions("classInstanceMemberFunction_188").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Int8, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
            .apply(StandardStructType<Int16, Int8, Int8>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                [GenericClassWith2TypeParameters<Int8, Int8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#5900: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#5901: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#5902: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#5903: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5904: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#5905: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5906: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5907: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#5908: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#5909: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#5910: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#5911: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#5912: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#5913: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#5914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#5915: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#5916: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#5917: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5918: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#5919: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#5920: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#5921: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [])
            @Expect("assertion#5922: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5923: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [])
            @Expect("assertion#5924: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [])
            @Expect("assertion#5925: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5926: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [])
            @Expect("assertion#5927: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(),
                    [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#5928: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#5929: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#5930: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(StandardStructType<Int16, Int8, Int8>(), [()])
            @Expect("assertion#5931: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5932: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_188")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5933: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_187 ends.")
    }
}
