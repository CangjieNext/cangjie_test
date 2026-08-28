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
}
