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
class testGetStaticFunctions_StandardClassType_10 {
    @TestCase
    func TestCase_264(): Unit {
        // logger.info("testcase TestCase_264 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>().getStaticFunctions("classStaticMemberFunction_47").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, UInt16, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_47")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64])
            @Expect("assertion#7838: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt16, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7839: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt16, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7840: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#7841: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7842: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt16, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [123i64, 114.514000f64])
            @Expect("assertion#7843: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt16, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#7844: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#7845: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#7846: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt16, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [123i64])
            @Expect("assertion#7847: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#7848: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#7849: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7850: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7851: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7852: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64, 114.514000f64])
            @Expect("assertion#7853: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [123i64, 114.514000f64])
            @Expect("assertion#7854: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#7855: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#7856: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(), [123i64])
            @Expect("assertion#7857: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#7858: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(), [])
            @Expect("assertion#7859: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7860: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(), [])
            @Expect("assertion#7861: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7862: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(), [123i64, 114.514000f64])
            @Expect("assertion#7863: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#7864: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt16, Int16>>(), [114.514000f64])
            @Expect("assertion#7865: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_47")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#7866: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_264 ends.")
    }
}
