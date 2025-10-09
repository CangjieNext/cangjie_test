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

    @TestCase
    func TestCase_71(): Unit {
        // logger.info("testcase TestCase_71 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, UInt8, Int16>>().getInstanceFunctions("classInstanceMemberFunction_72").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, UInt8, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
            .apply(StandardClassType<Float32, UInt8, Int16>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()],
                [GenericClassWith1TypeParameters<UInt64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#2185: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#2186: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2187: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(StandardClassType<Float32, UInt8, Int16>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2188: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2189: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2190: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(StandardClassType<Float32, UInt8, Int16>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2191: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2192: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#2193: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#2194: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(StandardClassType<Float32, UInt8, Int16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#2195: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(StandardClassType<Float32, UInt8, Int16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2196: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2197: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#2198: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(StandardClassType<Float32, UInt8, Int16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#2199: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(StandardClassType<Float32, UInt8, Int16>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#2200: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(StandardClassType<Float32, UInt8, Int16>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2201: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(StandardClassType<Float32, UInt8, Int16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#2202: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(StandardClassType<Float32, UInt8, Int16>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2203: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(StandardClassType<Float32, UInt8, Int16>(), [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#2204: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#2205: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#2206: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(StandardClassType<Float32, UInt8, Int16>(), [])
            @Expect("assertion#2207: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2208: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply("hello", [])
            @Expect("assertion#2209: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(StandardClassType<Float32, UInt8, Int16>(), [])
            @Expect("assertion#2210: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2211: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply("hello", [])
            @Expect("assertion#2212: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(StandardClassType<Float32, UInt8, Int16>(),
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#2213: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#2214: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#2215: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(StandardClassType<Float32, UInt8, Int16>(), [()])
            @Expect("assertion#2216: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2217: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_72")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2218: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_71 ends.")
    }

    @TestCase
    func TestCase_72(): Unit {
        // logger.info("testcase TestCase_72 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Unit, Int16>>().getInstanceFunctions("classInstanceMemberFunction_73").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Unit, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
            .apply(StandardClassType<Int16, Unit, Int16>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                [GenericClassWith1TypeParameters<Float32>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#2219: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#2220: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#2221: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(StandardClassType<Int16, Unit, Int16>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#2222: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply("hello",
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2223: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#2224: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(StandardClassType<Int16, Unit, Int16>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#2225: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2226: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#2227: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#2228: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(StandardClassType<Int16, Unit, Int16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#2229: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(StandardClassType<Int16, Unit, Int16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#2230: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#2231: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#2232: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(StandardClassType<Int16, Unit, Int16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#2233: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(StandardClassType<Int16, Unit, Int16>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#2234: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(StandardClassType<Int16, Unit, Int16>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#2235: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(StandardClassType<Int16, Unit, Int16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#2236: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(StandardClassType<Int16, Unit, Int16>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2237: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(StandardClassType<Int16, Unit, Int16>(), [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#2238: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#2239: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#2240: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(StandardClassType<Int16, Unit, Int16>(), [])
            @Expect("assertion#2241: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2242: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply("hello", [])
            @Expect("assertion#2243: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(StandardClassType<Int16, Unit, Int16>(), [])
            @Expect("assertion#2244: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2245: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply("hello", [])
            @Expect("assertion#2246: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(StandardClassType<Int16, Unit, Int16>(),
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#2247: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#2248: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#2249: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(StandardClassType<Int16, Unit, Int16>(), [()])
            @Expect("assertion#2250: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2251: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_73")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2252: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_72 ends.")
    }

    @TestCase
    func TestCase_73(): Unit {
        // logger.info("testcase TestCase_73 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Int64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_74").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Int64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
            .apply(StandardClassType<Int32, Int64, Float32>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2253: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2254: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2255: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2256: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2257: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2258: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2259: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2260: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2261: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2262: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2263: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#2264: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#2265: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#2266: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2267: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#2268: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2269: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2270: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2271: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2272: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2273: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#2274: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [])
            @Expect("assertion#2275: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2276: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [])
            @Expect("assertion#2277: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [])
            @Expect("assertion#2278: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2279: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [])
            @Expect("assertion#2280: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2281: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2282: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#2283: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(StandardClassType<Int32, Int64, Float32>(), [()])
            @Expect("assertion#2284: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2285: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_74")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2286: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_73 ends.")
    }

    @TestCase
    func TestCase_74(): Unit {
        // logger.info("testcase TestCase_74 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, UInt64, Float64>>().getInstanceFunctions("classInstanceMemberFunction_75").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, UInt64, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
            .apply(StandardClassType<Int8, UInt64, Float64>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2287: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2288: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2289: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2290: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2291: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2292: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#2293: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2294: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2295: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2296: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2297: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2298: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2299: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#2300: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2301: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#2302: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2303: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2304: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2305: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2306: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2307: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#2308: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [])
            @Expect("assertion#2309: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2310: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [])
            @Expect("assertion#2311: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [])
            @Expect("assertion#2312: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2313: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [])
            @Expect("assertion#2314: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2315: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2316: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#2317: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(StandardClassType<Int8, UInt64, Float64>(), [()])
            @Expect("assertion#2318: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2319: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt64, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_75")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2320: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_74 ends.")
    }
}
