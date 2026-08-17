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
    func TestCase_201(): Unit {
        // logger.info("testcase TestCase_201 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int32, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_202").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Int32, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
            .apply(StandardStructType<Int64, Int32, UInt32>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                [GenericStructWith1TypeParameters<Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6376: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6377: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6378: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6379: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6380: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6381: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6382: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6383: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6384: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6385: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6386: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6387: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6388: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#6389: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6390: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6391: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6392: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6393: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6394: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6395: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6396: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6397: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [])
            @Expect("assertion#6398: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6399: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [])
            @Expect("assertion#6400: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [])
            @Expect("assertion#6401: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6402: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [])
            @Expect("assertion#6403: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6404: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6405: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6406: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [()])
            @Expect("assertion#6407: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6408: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6409: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_201 ends.")
    }
}
