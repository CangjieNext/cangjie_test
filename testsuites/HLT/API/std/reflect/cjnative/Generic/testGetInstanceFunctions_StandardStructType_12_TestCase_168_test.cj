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
class testGetInstanceFunctions_StandardStructType_12 {
    @TestCase
    func TestCase_168(): Unit {
        // logger.info("testcase TestCase_168 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int8, Unit>>().getInstanceFunctions("classInstanceMemberFunction_169").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Int8, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
            .apply(StandardStructType<Float64, Int8, Unit>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#5254: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [NonGenericClass()])
            @Expect("assertion#5255: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5256: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5257: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#5258: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5259: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5260: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5261: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5262: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5263: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5264: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#5265: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#5266: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#5267: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#5268: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5269: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#5270: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5271: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5272: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [NonGenericClass()])
            @Expect("assertion#5273: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#5274: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#5275: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [])
            @Expect("assertion#5276: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5277: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [])
            @Expect("assertion#5278: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [])
            @Expect("assertion#5279: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5280: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [])
            @Expect("assertion#5281: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5282: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5283: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#5284: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(StandardStructType<Float64, Int8, Unit>(), [()])
            @Expect("assertion#5285: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#5286: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_169")[0i64]
                .apply("hello", [()])
            @Expect("assertion#5287: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_168 ends.")
    }
}
