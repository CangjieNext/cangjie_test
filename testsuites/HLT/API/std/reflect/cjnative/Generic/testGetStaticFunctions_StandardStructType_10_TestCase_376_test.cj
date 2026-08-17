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
class testGetStaticFunctions_StandardStructType_10 {
    @TestCase
    func TestCase_376(): Unit {
        // logger.info("testcase TestCase_376 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>().getStaticFunctions("classStaticMemberFunction_159").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Float64, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_159")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [1u32])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [1u32])
            @Expect("assertion#10636: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Float64, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10637: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Float64, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10638: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#10639: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10640: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Float64, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [1u32, 114.514000f64])
            @Expect("assertion#10641: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Float64, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [1u32, 114.514000f64])
            @Expect("assertion#10642: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#10643: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#10644: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, Float64, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [1u32])
            @Expect("assertion#10645: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [1u32])
            @Expect("assertion#10646: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#10647: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10648: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10649: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10650: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [1u32, 114.514000f64])
            @Expect("assertion#10651: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [1u32, 114.514000f64])
            @Expect("assertion#10652: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>()], [114.514000f64])
            @Expect("assertion#10653: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#10654: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(), [1u32])
            @Expect("assertion#10655: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [1u32])
            @Expect("assertion#10656: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(), [])
            @Expect("assertion#10657: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10658: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(), [])
            @Expect("assertion#10659: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10660: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(), [1u32, 114.514000f64])
            @Expect("assertion#10661: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [1u32, 114.514000f64])
            @Expect("assertion#10662: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Float64, Int8>>(), [114.514000f64])
            @Expect("assertion#10663: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_159")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#10664: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_376 ends.")
    }
}
