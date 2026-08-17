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
class testGetInstanceFunctions_StandardClassType_13 {
    @TestCase
    func TestCase_63(): Unit {
        // logger.info("testcase TestCase_63 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Int8, Float32>>().getInstanceFunctions("classInstanceMemberFunction_64").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Int8, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
            .apply(StandardClassType<Float32, Int8, Float32>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
            @Expect("assertion#1913: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [NonGenericClass()])
            @Expect("assertion#1914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#1915: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#1916: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1917: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#1918: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#1919: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1920: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1921: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1922: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1923: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#1924: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#1925: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#1926: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#1927: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#1928: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#1929: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1930: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1931: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [NonGenericClass()])
            @Expect("assertion#1932: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#1933: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#1934: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [])
            @Expect("assertion#1935: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1936: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [])
            @Expect("assertion#1937: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [])
            @Expect("assertion#1938: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1939: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [])
            @Expect("assertion#1940: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1941: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1942: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1943: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(StandardClassType<Float32, Int8, Float32>(), [()])
            @Expect("assertion#1944: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1945: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_64")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1946: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_63 ends.")
    }
}
