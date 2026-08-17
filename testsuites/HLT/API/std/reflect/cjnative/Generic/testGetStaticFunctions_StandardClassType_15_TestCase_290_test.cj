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
class testGetStaticFunctions_StandardClassType_15 {
    @TestCase
    func TestCase_290(): Unit {
        // logger.info("testcase TestCase_290 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>().getStaticFunctions("classStaticMemberFunction_73").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, UInt64, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_73")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                [GenericClassWith1TypeParameters<Int8>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#8592: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt64, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#8593: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt64, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#8594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8595: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8596: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt64, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#8597: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt64, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#8598: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#8599: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#8600: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt64, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#8601: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#8602: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8603: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8604: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#8605: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#8606: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#8607: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#8608: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8610: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#8611: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#8612: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(), [])
            @Expect("assertion#8613: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8614: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(), [])
            @Expect("assertion#8615: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8616: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(),
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#8617: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#8618: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt64, Float64>>(), [()])
            @Expect("assertion#8619: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt64, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_73")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8620: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_290 ends.")
    }
}
