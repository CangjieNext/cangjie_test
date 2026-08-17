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
class testGetInstanceFunctions_StandardClassType_17 {
    @TestCase
    func TestCase_82(): Unit {
        // logger.info("testcase TestCase_82 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int8, Unit>>().getInstanceFunctions("classInstanceMemberFunction_83").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Int8, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
            .apply(StandardClassType<Int16, Int8, Unit>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
            @Expect("assertion#2559: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#2560: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2561: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2562: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2563: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2564: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2565: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2566: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2567: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2568: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2569: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2570: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2571: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#2572: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#2573: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#2574: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2575: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2576: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2577: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [NonGenericStruct()])
            @Expect("assertion#2578: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#2579: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#2580: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [])
            @Expect("assertion#2581: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2582: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [])
            @Expect("assertion#2583: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [])
            @Expect("assertion#2584: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2585: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [])
            @Expect("assertion#2586: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2587: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2588: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#2589: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(StandardClassType<Int16, Int8, Unit>(), [()])
            @Expect("assertion#2590: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2591: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_83")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2592: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_82 ends.")
    }
}
