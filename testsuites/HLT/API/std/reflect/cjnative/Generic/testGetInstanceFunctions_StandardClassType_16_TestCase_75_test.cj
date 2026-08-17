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
class testGetInstanceFunctions_StandardClassType_16 {
    @TestCase
    func TestCase_75(): Unit {
        // logger.info("testcase TestCase_75 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, Float64, Int64>>().getInstanceFunctions("classInstanceMemberFunction_76").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, Float64, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
            .apply(StandardClassType<Int8, Float64, Int64>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#2321: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#2322: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2323: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2324: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2325: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2326: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2327: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2328: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#2329: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#2330: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#2331: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#2332: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#2333: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#2334: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#2335: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#2336: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#2337: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#2338: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2339: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#2340: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#2341: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#2342: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [])
            @Expect("assertion#2343: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2344: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [])
            @Expect("assertion#2345: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [])
            @Expect("assertion#2346: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2347: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [])
            @Expect("assertion#2348: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#2349: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#2350: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#2351: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(StandardClassType<Int8, Float64, Int64>(), [()])
            @Expect("assertion#2352: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2353: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Float64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_76")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2354: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_75 ends.")
    }
}
