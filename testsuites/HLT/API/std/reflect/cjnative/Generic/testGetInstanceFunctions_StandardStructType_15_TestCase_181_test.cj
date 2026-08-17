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
class testGetInstanceFunctions_StandardStructType_15 {
    @TestCase
    func TestCase_181(): Unit {
        // logger.info("testcase TestCase_181 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int16, Float64>>().getInstanceFunctions("classInstanceMemberFunction_182").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Int16, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
            .apply(StandardStructType<Bool, Int16, Float64>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()],
                [GenericClassWith1TypeParameters<Int16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#5696: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#5697: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5698: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5699: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5700: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5701: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5702: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5703: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#5704: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#5705: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#5706: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#5707: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#5708: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#5709: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#5710: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#5711: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#5712: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#5713: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5714: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#5715: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#5716: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#5717: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [])
            @Expect("assertion#5718: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5719: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [])
            @Expect("assertion#5720: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [])
            @Expect("assertion#5721: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5722: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [])
            @Expect("assertion#5723: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(),
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#5724: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#5725: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#5726: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(StandardStructType<Bool, Int16, Float64>(), [()])
            @Expect("assertion#5727: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5728: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_182")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5729: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_181 ends.")
    }
}
