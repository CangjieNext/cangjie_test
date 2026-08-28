/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
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
class testGetStaticFunctions_StandardClassType_1 {
    @TestCase
    func TestCase_221(): Unit {
        // logger.info("testcase TestCase_221 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>().getStaticFunctions("classStaticMemberFunction_4").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, UInt32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_4")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                    GenericStructWith1TypeParameters<Float64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#6999: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7000: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7001: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7002: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7003: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#7004: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#7005: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [(), GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7006: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [(), GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7007: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Float64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, (), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7008: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, (), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7009: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Float64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(), ()])
            @Expect("assertion#7010: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(), ()])
            @Expect("assertion#7011: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7012: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7013: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7016: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7017: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#7018: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#7019: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [(), GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7020: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [(), GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7021: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [114.514000f64, (), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7022: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, (), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7023: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(), ()])
            @Expect("assertion#7024: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(), ()])
            @Expect("assertion#7025: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7026: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7027: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [GenericStructWith2TypeParameters<Float64, Float64>(), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7028: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [GenericStructWith2TypeParameters<Float64, Float64>(), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7029: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7030: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7031: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#7032: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#7033: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [(), GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7034: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [(), GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7035: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [114.514000f64, (), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7036: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64, (), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7037: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(), ()])
            @Expect("assertion#7038: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(), ()])
            @Expect("assertion#7039: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_221 ends.")
    }
}
