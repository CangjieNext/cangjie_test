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
class testGetStaticFunctions_StandardStructType_12 {
    @TestCase
    func TestCase_384(): Unit {
        // logger.info("testcase TestCase_384 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>().getStaticFunctions("classStaticMemberFunction_167").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, UInt64, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_167")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericClass()])
            @Expect("assertion#10868: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10869: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10870: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10871: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10872: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10873: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10874: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#10875: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#10876: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
            @Expect("assertion#10877: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#10878: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10879: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10880: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10881: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10882: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10883: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10884: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#10885: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10886: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(), [NonGenericClass()])
            @Expect("assertion#10887: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#10888: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(), [])
            @Expect("assertion#10889: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10890: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(), [])
            @Expect("assertion#10891: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10892: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10893: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10894: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, UInt64>>(), [()])
            @Expect("assertion#10895: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_167")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10896: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_384 ends.")
    }
}
