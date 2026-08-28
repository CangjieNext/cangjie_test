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
    func TestCase_412(): Unit {
        // logger.info("testcase TestCase_412 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>().getStaticFunctions("classStaticMemberFunction_195").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, Unit, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_195")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
            @Expect("assertion#11680: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Unit, UInt32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11681: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Unit, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#11682: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11683: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11684: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Unit, UInt32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11685: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Unit, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11686: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11687: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11688: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Unit, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#11689: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#11690: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11691: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11692: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11693: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#11694: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11695: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11696: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11697: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11698: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(), [NonGenericStruct()])
            @Expect("assertion#11699: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11700: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(), [])
            @Expect("assertion#11701: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11702: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(), [])
            @Expect("assertion#11703: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11704: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11705: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11706: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(), [()])
            @Expect("assertion#11707: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11708: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_412 ends.")
    }
}
