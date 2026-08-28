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
    func TestCase_377(): Unit {
        // logger.info("testcase TestCase_377 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int64, Float32>>().getStaticFunctions("classStaticMemberFunction_160").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Int64, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_160")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [123i64])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [123i64])
            @Expect("assertion#10665: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10666: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10667: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10668: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10669: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [123i64, 114.514000f64])
            @Expect("assertion#10670: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#10671: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#10672: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#10673: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [123i64])
            @Expect("assertion#10674: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#10675: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10676: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10677: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10678: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10679: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [123i64, 114.514000f64])
            @Expect("assertion#10680: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [123i64, 114.514000f64])
            @Expect("assertion#10681: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#10682: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#10683: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(), [123i64])
            @Expect("assertion#10684: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#10685: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(), [])
            @Expect("assertion#10686: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10687: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(), [])
            @Expect("assertion#10688: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10689: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(), [123i64, 114.514000f64])
            @Expect("assertion#10690: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#10691: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Float32>>(), [114.514000f64])
            @Expect("assertion#10692: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_160")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#10693: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_377 ends.")
    }
}
