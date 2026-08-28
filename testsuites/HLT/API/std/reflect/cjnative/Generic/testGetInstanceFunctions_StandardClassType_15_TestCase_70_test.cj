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
class testGetInstanceFunctions_StandardClassType_15 {
    @TestCase
    func TestCase_70(): Unit {
        // logger.info("testcase TestCase_70 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Int8, Int8>>().getInstanceFunctions("classInstanceMemberFunction_71").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Int8, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
            .apply(StandardClassType<Float32, Int8, Int8>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                [GenericClassWith1TypeParameters<UInt64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#2151: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#2152: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2153: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(StandardClassType<Float32, Int8, Int8>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2154: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2155: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2156: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(StandardClassType<Float32, Int8, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2157: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2158: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#2159: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#2160: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(StandardClassType<Float32, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#2161: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(StandardClassType<Float32, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2162: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2163: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2164: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(StandardClassType<Float32, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#2165: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(StandardClassType<Float32, Int8, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2166: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(StandardClassType<Float32, Int8, Int8>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2167: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(StandardClassType<Float32, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#2168: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(StandardClassType<Float32, Int8, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2169: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(StandardClassType<Float32, Int8, Int8>(), [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#2170: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#2171: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#2172: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(StandardClassType<Float32, Int8, Int8>(), [])
            @Expect("assertion#2173: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2174: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply("hello", [])
            @Expect("assertion#2175: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(StandardClassType<Float32, Int8, Int8>(), [])
            @Expect("assertion#2176: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2177: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply("hello", [])
            @Expect("assertion#2178: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(StandardClassType<Float32, Int8, Int8>(),
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#2179: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#2180: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#2181: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(StandardClassType<Float32, Int8, Int8>(), [()])
            @Expect("assertion#2182: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2183: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_71")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2184: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_70 ends.")
    }
}
