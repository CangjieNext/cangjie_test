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
class testGetStaticFunctions_StandardClassType_20 {
    @TestCase
    func TestCase_316(): Unit {
        // logger.info("testcase TestCase_316 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, Int32, Float64>>().getStaticFunctions("classStaticMemberFunction_99").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, Int32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_99")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()],
                [GenericStructWith1TypeParameters<UInt64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9346: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int32, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9347: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9348: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9350: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int32, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9351: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9352: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#9353: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#9354: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9355: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9356: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9357: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9358: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9359: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9360: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9361: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9362: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#9363: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9364: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9365: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9366: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(), [])
            @Expect("assertion#9367: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9368: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(), [])
            @Expect("assertion#9369: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9370: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(),
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9371: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9372: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, Int32, Float64>>(), [()])
            @Expect("assertion#9373: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_99")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9374: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_316 ends.")
    }
}
