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
class testGetStaticFunctions_StandardStructType_16 {
    @TestCase
    func TestCase_404(): Unit {
        // logger.info("testcase TestCase_404 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Bool, Int64>>().getStaticFunctions("classStaticMemberFunction_187").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Bool, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_187")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11448: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Bool, Int64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11449: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Bool, Int64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11450: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#11451: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11452: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Bool, Int64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11453: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Bool, Int64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11454: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11455: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11456: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int64, Bool, Int64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11457: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11458: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#11459: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11460: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11461: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11462: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11463: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11464: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#11465: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11466: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11467: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11468: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(), [])
            @Expect("assertion#11469: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11470: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(), [])
            @Expect("assertion#11471: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11472: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11473: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11474: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Bool, Int64>>(), [()])
            @Expect("assertion#11475: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_187")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11476: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_404 ends.")
    }
}
