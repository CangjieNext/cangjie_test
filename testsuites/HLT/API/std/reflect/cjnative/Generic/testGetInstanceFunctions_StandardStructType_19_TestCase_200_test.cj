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
class testGetInstanceFunctions_StandardStructType_19 {
    @TestCase
    func TestCase_200(): Unit {
        // logger.info("testcase TestCase_200 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Float32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_201").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Float32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
            .apply(StandardStructType<UInt32, Float32, Int8>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6342: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6343: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6344: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6345: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6346: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6347: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6348: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6350: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6351: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6352: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#6353: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#6354: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#6355: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6356: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6357: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6358: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6359: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6360: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6361: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6362: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6363: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [])
            @Expect("assertion#6364: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6365: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [])
            @Expect("assertion#6366: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [])
            @Expect("assertion#6367: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6368: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [])
            @Expect("assertion#6369: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6370: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6371: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6372: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [()])
            @Expect("assertion#6373: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6374: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6375: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_200 ends.")
    }
}
