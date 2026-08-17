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
class testGetInstanceFunctions_StandardClassType_10 {
    @TestCase
    func TestCase_46(): Unit {
        // logger.info("testcase TestCase_46 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int8, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_47").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Int8, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
            .apply(StandardClassType<UInt64, Int8, UInt32>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64])
            @Expect("assertion#1335: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [123i64])
            @Expect("assertion#1336: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1337: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1338: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1339: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1340: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#1341: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1342: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64, 114.514000f64])
            @Expect("assertion#1343: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [123i64, 114.514000f64])
            @Expect("assertion#1344: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#1345: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#1346: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#1347: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#1348: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#1349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#1350: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1351: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64, 114.514000f64])
            @Expect("assertion#1352: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#1353: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [123i64])
            @Expect("assertion#1354: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#1355: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#1356: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [])
            @Expect("assertion#1357: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1358: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [])
            @Expect("assertion#1359: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [])
            @Expect("assertion#1360: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1361: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [])
            @Expect("assertion#1362: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [123i64, 114.514000f64])
            @Expect("assertion#1363: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#1364: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#1365: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(StandardClassType<UInt64, Int8, UInt32>(), [114.514000f64])
            @Expect("assertion#1366: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#1367: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_47")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#1368: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_46 ends.")
    }
}
