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
class testGetInstanceFunctions_StandardClassType_14 {
    @TestCase
    func TestCase_67(): Unit {
        // logger.info("testcase TestCase_67 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Int8, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_68").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, Int8, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
            .apply(StandardClassType<Unit, Int8, UInt64>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2049: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2050: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2051: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2052: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2053: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2054: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2055: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2056: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2057: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2058: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2059: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2060: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2061: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#2062: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2063: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#2064: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2065: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2066: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2067: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2068: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2069: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2070: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [])
            @Expect("assertion#2071: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2072: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [])
            @Expect("assertion#2073: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [])
            @Expect("assertion#2074: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2075: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [])
            @Expect("assertion#2076: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2077: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2078: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2079: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(StandardClassType<Unit, Int8, UInt64>(), [()])
            @Expect("assertion#2080: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2081: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_68")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2082: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_67 ends.")
    }
}
