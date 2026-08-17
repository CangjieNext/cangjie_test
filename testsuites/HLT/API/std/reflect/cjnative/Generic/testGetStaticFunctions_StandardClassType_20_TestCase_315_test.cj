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
    func TestCase_315(): Unit {
        // logger.info("testcase TestCase_315 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>().getStaticFunctions("classStaticMemberFunction_98").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Int16, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_98")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()],
                [GenericStructWith1TypeParameters<Int32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#9317: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int16, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#9318: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int16, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#9319: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9320: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9321: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int16, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#9322: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int16, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#9323: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#9324: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#9325: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int16, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#9326: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#9327: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9328: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9329: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#9330: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#9331: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#9332: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#9333: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#9334: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9335: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#9336: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#9337: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(), [])
            @Expect("assertion#9338: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9339: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(), [])
            @Expect("assertion#9340: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9341: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(),
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#9342: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#9343: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int16, Float64>>(), [()])
            @Expect("assertion#9344: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_98")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9345: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_315 ends.")
    }
}
