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
class testGetStaticFunctions_StandardClassType_18 {
    @TestCase
    func TestCase_305(): Unit {
        // logger.info("testcase TestCase_305 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>().getStaticFunctions("classStaticMemberFunction_88").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, UInt64, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_88")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#9027: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt64, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9028: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9029: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9030: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9031: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt64, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9032: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9033: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#9034: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#9035: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [NonGenericStruct()])
            @Expect("assertion#9036: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#9037: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9038: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9039: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9040: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9041: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9042: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9043: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9044: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9045: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(), [NonGenericStruct()])
            @Expect("assertion#9046: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#9047: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(), [])
            @Expect("assertion#9048: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9049: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(), [])
            @Expect("assertion#9050: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9051: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9052: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9053: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(), [()])
            @Expect("assertion#9054: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9055: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_305 ends.")
    }
}
