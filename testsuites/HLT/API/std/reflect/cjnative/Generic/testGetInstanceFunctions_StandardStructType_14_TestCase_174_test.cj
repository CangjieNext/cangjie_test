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
    func TestCase_174(): Unit {
        // logger.info("testcase TestCase_174 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, UInt16, Int32>>().getInstanceFunctions("classInstanceMemberFunction_175").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, UInt16, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
            .apply(StandardStructType<UInt8, UInt16, Int32>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()],
                [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5458: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5459: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5460: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5461: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5462: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5463: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5464: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5465: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5466: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5467: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5468: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5469: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5470: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#5471: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5472: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5473: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5474: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5475: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5476: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5477: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5478: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5479: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [])
            @Expect("assertion#5480: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5481: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [])
            @Expect("assertion#5482: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [])
            @Expect("assertion#5483: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5484: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [])
            @Expect("assertion#5485: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5486: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5487: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5488: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(StandardStructType<UInt8, UInt16, Int32>(), [()])
            @Expect("assertion#5489: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5490: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_175")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5491: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_174 ends.")
    }
}
