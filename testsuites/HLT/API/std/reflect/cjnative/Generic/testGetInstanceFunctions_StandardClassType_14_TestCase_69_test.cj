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
class testGetInstanceFunctions_StandardClassType_14 {
    @TestCase
    func TestCase_69(): Unit {
        // logger.info("testcase TestCase_69 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Bool, Unit>>().getInstanceFunctions("classInstanceMemberFunction_70").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Bool, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
            .apply(StandardClassType<Int16, Bool, Unit>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()],
                [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2118: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2119: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2120: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#2121: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2122: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2123: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#2124: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2125: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2126: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2127: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2128: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#2129: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2130: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2131: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#2132: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#2133: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2134: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#2135: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2136: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2137: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#2138: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [])
            @Expect("assertion#2139: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2140: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [])
            @Expect("assertion#2141: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [])
            @Expect("assertion#2142: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [])
            @Expect("assertion#2143: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [])
            @Expect("assertion#2144: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2145: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2146: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#2147: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(StandardClassType<Int16, Bool, Unit>(), [()])
            @Expect("assertion#2148: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#2149: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_70")[0i64]
                .apply("hello", [()])
            @Expect("assertion#2150: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_69 ends.")
    }
}
