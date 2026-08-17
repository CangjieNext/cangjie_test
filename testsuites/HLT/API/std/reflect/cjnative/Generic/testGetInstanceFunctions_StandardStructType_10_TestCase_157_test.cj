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
class testGetInstanceFunctions_StandardStructType_10 {
    @TestCase
    func TestCase_157(): Unit {
        // logger.info("testcase TestCase_157 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt64, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_158").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt64, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
            .apply(StandardStructType<Unit, UInt64, UInt8>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#4880: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#4881: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4882: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4883: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#4884: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4885: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#4886: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#4887: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [(), 114.514000f64])
            @Expect("assertion#4888: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [(), 114.514000f64])
            @Expect("assertion#4889: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [(), 114.514000f64])
            @Expect("assertion#4890: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [123i64])
            @Expect("assertion#4891: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [123i64])
            @Expect("assertion#4892: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [123i64])
            @Expect("assertion#4893: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#4894: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#4895: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#4896: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [(), 114.514000f64])
            @Expect("assertion#4897: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#4898: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [()])
            @Expect("assertion#4899: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4900: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4901: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [])
            @Expect("assertion#4902: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4903: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [])
            @Expect("assertion#4904: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [])
            @Expect("assertion#4905: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4906: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [])
            @Expect("assertion#4907: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [(), 114.514000f64])
            @Expect("assertion#4908: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [(), 114.514000f64])
            @Expect("assertion#4909: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [(), 114.514000f64])
            @Expect("assertion#4910: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(StandardStructType<Unit, UInt64, UInt8>(), [123i64])
            @Expect("assertion#4911: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#4912: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_158")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#4913: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_157 ends.")
    }
}
