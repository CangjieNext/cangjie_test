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
class testGetInstanceFunctions_StandardStructType_14 {
    @TestCase
    func TestCase_177(): Unit {
        // logger.info("testcase TestCase_177 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, UInt64, Int64>>().getInstanceFunctions("classInstanceMemberFunction_178").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, UInt64, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
            .apply(StandardStructType<UInt64, UInt64, Int64>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>()],
                [GenericClassWith1TypeParameters<UInt64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#5560: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#5561: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5562: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5563: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5564: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5565: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5566: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5567: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#5568: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#5569: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#5570: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#5571: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#5572: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#5573: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#5574: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5575: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5576: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#5577: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5578: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#5579: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#5580: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#5581: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [])
            @Expect("assertion#5582: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5583: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [])
            @Expect("assertion#5584: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [])
            @Expect("assertion#5585: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5586: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [])
            @Expect("assertion#5587: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(),
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#5588: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#5589: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#5590: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(StandardStructType<UInt64, UInt64, Int64>(), [()])
            @Expect("assertion#5591: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5592: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_178")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5593: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_177 ends.")
    }
}
