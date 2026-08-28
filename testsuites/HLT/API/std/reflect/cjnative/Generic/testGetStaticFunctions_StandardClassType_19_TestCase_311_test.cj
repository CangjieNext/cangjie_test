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
class testGetStaticFunctions_StandardClassType_19 {
    @TestCase
    func TestCase_311(): Unit {
        // logger.info("testcase TestCase_311 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>().getStaticFunctions("classStaticMemberFunction_94").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, UInt8, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_94")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()],
                [GenericStructWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#9201: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt8, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#9202: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt8, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#9203: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9204: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9205: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt8, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#9206: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt8, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#9207: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#9208: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#9209: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt8, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#9210: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#9211: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9212: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9213: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#9214: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#9215: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#9216: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#9217: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#9218: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9219: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#9220: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#9221: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(), [])
            @Expect("assertion#9222: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9223: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(), [])
            @Expect("assertion#9224: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9225: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(),
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#9226: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#9227: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt8, UInt64>>(), [()])
            @Expect("assertion#9228: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_94")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9229: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_311 ends.")
    }
}
