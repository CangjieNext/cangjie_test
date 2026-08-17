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
    func TestCase_178(): Unit {
        // logger.info("testcase TestCase_178 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, UInt16, Bool>>().getInstanceFunctions("classInstanceMemberFunction_179").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, UInt16, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
            .apply(StandardStructType<Int64, UInt16, Bool>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()],
                [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5595: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5596: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5597: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello",
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#5598: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5599: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5600: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5601: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5602: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5603: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5604: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#5605: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#5606: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#5607: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5608: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#5610: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5611: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5612: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5613: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5614: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#5615: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [])
            @Expect("assertion#5616: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5617: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [])
            @Expect("assertion#5618: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [])
            @Expect("assertion#5619: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5620: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [])
            @Expect("assertion#5621: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5622: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5623: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#5624: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(StandardStructType<Int64, UInt16, Bool>(), [()])
            @Expect("assertion#5625: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5626: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_179")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5627: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_178 ends.")
    }
}
