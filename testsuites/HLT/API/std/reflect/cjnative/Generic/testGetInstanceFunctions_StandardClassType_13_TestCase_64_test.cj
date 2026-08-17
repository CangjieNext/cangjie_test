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
    func TestCase_64(): Unit {
        // logger.info("testcase TestCase_64 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Int16, Unit>>().getInstanceFunctions("classInstanceMemberFunction_65").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, Int16, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
            .apply(StandardClassType<Bool, Int16, Unit>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#1947: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#1948: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1949: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1950: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1951: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1952: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1953: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1954: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1955: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1956: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1957: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#1958: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#1959: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#1960: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#1961: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#1962: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1963: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1964: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1965: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#1966: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#1967: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#1968: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [])
            @Expect("assertion#1969: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1970: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [])
            @Expect("assertion#1971: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [])
            @Expect("assertion#1972: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1973: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [])
            @Expect("assertion#1974: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1975: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1976: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#1977: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(StandardClassType<Bool, Int16, Unit>(), [()])
            @Expect("assertion#1978: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1979: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int16, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_65")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1980: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_64 ends.")
    }
}
