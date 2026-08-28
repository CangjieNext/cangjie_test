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
class testGetInstanceFunctions_StandardStructType_21 {
    @TestCase
    func TestCase_209(): Unit {
        // logger.info("testcase TestCase_209 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_210").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Int64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
            .apply(StandardStructType<Int32, Int64, Float32>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                [GenericStructWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6648: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6649: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6650: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6651: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6652: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6653: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6654: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6655: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6656: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6657: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6658: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6659: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6660: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#6661: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6662: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [TypeInfo.of<Float32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6663: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6664: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6665: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6666: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6667: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6668: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#6669: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [])
            @Expect("assertion#6670: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6671: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [])
            @Expect("assertion#6672: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [])
            @Expect("assertion#6673: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6674: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [])
            @Expect("assertion#6675: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6676: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6677: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#6678: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(StandardStructType<Int32, Int64, Float32>(), [()])
            @Expect("assertion#6679: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6680: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_210")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6681: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_209 ends.")
    }
}
