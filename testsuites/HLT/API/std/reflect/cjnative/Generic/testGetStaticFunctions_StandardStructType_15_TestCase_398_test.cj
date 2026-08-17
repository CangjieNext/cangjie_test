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
class testGetStaticFunctions_StandardStructType_15 {
    @TestCase
    func TestCase_398(): Unit {
        // logger.info("testcase TestCase_398 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>().getStaticFunctions("classStaticMemberFunction_181").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, UInt16, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_181")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()],
                [GenericClassWith1TypeParameters<Int16>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#11274: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11275: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11276: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11277: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11278: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#11279: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#11280: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11281: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11282: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#11283: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#11284: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11285: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11286: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11287: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11288: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#11289: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#11290: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11291: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11292: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#11293: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#11294: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(), [])
            @Expect("assertion#11295: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11296: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(), [])
            @Expect("assertion#11297: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11298: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(),
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#11299: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#11300: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Int16>>(), [()])
            @Expect("assertion#11301: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_181")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11302: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_398 ends.")
    }
}
