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
class testGetStaticFunctions_StandardStructType_11 {
    @TestCase
    func TestCase_380(): Unit {
        // logger.info("testcase TestCase_380 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>().getStaticFunctions("classStaticMemberFunction_163").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, UInt64, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_163")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [123u64])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [123u64])
            @Expect("assertion#10752: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#10753: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#10754: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#10755: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10756: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [123u64, 114.514000f64])
            @Expect("assertion#10757: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [123u64, 114.514000f64])
            @Expect("assertion#10758: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [114.514000f64])
            @Expect("assertion#10759: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [114.514000f64])
            @Expect("assertion#10760: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [123u64])
            @Expect("assertion#10761: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [123u64])
            @Expect("assertion#10762: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#10763: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10764: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#10765: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#10766: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [123u64, 114.514000f64])
            @Expect("assertion#10767: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [123u64, 114.514000f64])
            @Expect("assertion#10768: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#10769: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#10770: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(), [123u64])
            @Expect("assertion#10771: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<Int64>(), [123u64])
            @Expect("assertion#10772: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(), [])
            @Expect("assertion#10773: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10774: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(), [])
            @Expect("assertion#10775: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10776: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(), [123u64, 114.514000f64])
            @Expect("assertion#10777: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<Int64>(), [123u64, 114.514000f64])
            @Expect("assertion#10778: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt32>>(), [114.514000f64])
            @Expect("assertion#10779: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_163")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#10780: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_380 ends.")
    }
}
