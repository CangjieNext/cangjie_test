/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// (not MAC) EXEC: cd dependency && %compiler %cmp_opt --output-type=dylib  *.cj -o libdependency.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output --import-path . -L dependency -ldependency
// (not MAC) RUN-EXEC: %cp ./dependency/libdependency.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args  
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

    @TestCase
    func TestCase_378(): Unit {
        // logger.info("testcase TestCase_378 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>().getStaticFunctions("classStaticMemberFunction_161").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt8, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_161")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [1i32])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [1i32])
            @Expect("assertion#10694: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10695: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10696: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10697: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10698: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [1i32, 114.514000f64])
            @Expect("assertion#10699: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [1i32, 114.514000f64])
            @Expect("assertion#10700: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#10701: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#10702: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [1i32])
            @Expect("assertion#10703: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [1i32])
            @Expect("assertion#10704: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10705: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10706: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10707: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10708: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [1i32, 114.514000f64])
            @Expect("assertion#10709: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [1i32, 114.514000f64])
            @Expect("assertion#10710: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#10711: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#10712: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(), [1i32])
            @Expect("assertion#10713: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32])
            @Expect("assertion#10714: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(), [])
            @Expect("assertion#10715: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10716: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(), [])
            @Expect("assertion#10717: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10718: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(), [1i32, 114.514000f64])
            @Expect("assertion#10719: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32, 114.514000f64])
            @Expect("assertion#10720: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(), [114.514000f64])
            @Expect("assertion#10721: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#10722: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_378 ends.")
    }

    @TestCase
    func TestCase_379(): Unit {
        // logger.info("testcase TestCase_379 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int64, Unit>>().getStaticFunctions("classStaticMemberFunction_162").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Int64, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_162")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [114.514000f32])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [114.514000f32])
            @Expect("assertion#10723: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int64, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10724: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10725: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10726: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10727: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int64, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()],
                    [114.514000f32, 114.514000f64])
            @Expect("assertion#10728: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f32, 114.514000f64])
            @Expect("assertion#10729: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#10730: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#10731: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [114.514000f32])
            @Expect("assertion#10732: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f32])
            @Expect("assertion#10733: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10734: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10735: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10736: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10737: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [114.514000f32, 114.514000f64])
            @Expect("assertion#10738: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [114.514000f32, 114.514000f64])
            @Expect("assertion#10739: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#10740: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10741: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(), [114.514000f32])
            @Expect("assertion#10742: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f32])
            @Expect("assertion#10743: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(), [])
            @Expect("assertion#10744: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10745: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(), [])
            @Expect("assertion#10746: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10747: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(), [114.514000f32, 114.514000f64])
            @Expect("assertion#10748: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f32, 114.514000f64])
            @Expect("assertion#10749: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(), [()])
            @Expect("assertion#10750: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10751: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_379 ends.")
    }

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

    @TestCase
    func TestCase_381(): Unit {
        // logger.info("testcase TestCase_381 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int8, Int32>>().getStaticFunctions("classStaticMemberFunction_164").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Int8, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_164")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#10781: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10782: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10783: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#10784: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10785: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [(), 114.514000f64])
            @Expect("assertion#10786: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [(), 114.514000f64])
            @Expect("assertion#10787: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [123i64])
            @Expect("assertion#10788: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [123i64])
            @Expect("assertion#10789: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#10790: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10791: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#10792: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10793: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10794: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10795: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [(), 114.514000f64])
            @Expect("assertion#10796: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [(), 114.514000f64])
            @Expect("assertion#10797: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [123i64])
            @Expect("assertion#10798: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#10799: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [()])
            @Expect("assertion#10800: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10801: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [])
            @Expect("assertion#10802: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10803: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [])
            @Expect("assertion#10804: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10805: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [(), 114.514000f64])
            @Expect("assertion#10806: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [(), 114.514000f64])
            @Expect("assertion#10807: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [123i64])
            @Expect("assertion#10808: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#10809: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_381 ends.")
    }
}
