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
class testGetStaticFunctions_StandardStructType_20 {
    @TestCase
    func TestCase_423(): Unit {
        // logger.info("testcase TestCase_423 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>().getStaticFunctions("classStaticMemberFunction_206").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, UInt16, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_206")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int16>()],
                [GenericStructWith1TypeParameters<Int16>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#11999: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt16, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12000: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt16, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12001: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#12002: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12003: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt16, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#12004: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt16, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#12005: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#12006: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#12007: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt16, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#12008: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#12009: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#12010: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12011: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12012: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12013: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#12014: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#12015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12017: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#12018: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int16>()])
            @Expect("assertion#12019: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(), [])
            @Expect("assertion#12020: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12021: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(), [])
            @Expect("assertion#12022: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12023: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(),
                    [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#12024: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#12025: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt16, Int16>>(), [()])
            @Expect("assertion#12026: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_206")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12027: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_423 ends.")
    }
}
