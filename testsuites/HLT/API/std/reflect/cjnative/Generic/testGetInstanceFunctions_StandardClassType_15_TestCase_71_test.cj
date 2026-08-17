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
}
