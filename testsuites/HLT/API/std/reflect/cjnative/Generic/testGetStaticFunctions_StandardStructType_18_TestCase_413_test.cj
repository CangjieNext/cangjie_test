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
class testGetStaticFunctions_StandardStructType_18 {
    @TestCase
    func TestCase_413(): Unit {
        // logger.info("testcase TestCase_413 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>().getStaticFunctions("classStaticMemberFunction_196").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, UInt64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_196")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
            @Expect("assertion#11709: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, UInt64, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#11710: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, UInt64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#11711: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11712: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11713: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, UInt64, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11714: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, UInt64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11715: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#11716: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#11717: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, UInt64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [NonGenericStruct()])
            @Expect("assertion#11718: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#11719: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11720: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11721: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#11722: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#11723: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11724: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11725: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11726: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11727: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(), [NonGenericStruct()])
            @Expect("assertion#11728: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11729: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(), [])
            @Expect("assertion#11730: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11731: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(), [])
            @Expect("assertion#11732: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11733: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11734: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11735: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(), [()])
            @Expect("assertion#11736: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11737: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_413 ends.")
    }
}
