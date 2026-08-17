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
class testGetInstanceFunctions_StandardStructType_22 {
    @TestCase
    func TestCase_214(): Unit {
        // logger.info("testcase TestCase_214 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt32, Int64>>().getInstanceFunctions("classInstanceMemberFunction_215").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt32, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
            .apply(StandardStructType<Unit, UInt32, Int64>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>()],
                [GenericStructWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6818: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6819: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6820: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6821: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6822: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6823: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6824: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6825: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6826: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6827: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6828: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6829: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6830: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6831: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6832: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6833: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6834: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6835: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6836: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6837: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6838: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6839: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [])
            @Expect("assertion#6840: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6841: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [])
            @Expect("assertion#6842: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [])
            @Expect("assertion#6843: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6844: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [])
            @Expect("assertion#6845: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6846: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6847: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6848: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(StandardStructType<Unit, UInt32, Int64>(), [()])
            @Expect("assertion#6849: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6850: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt32, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_215")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6851: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_214 ends.")
    }
}
