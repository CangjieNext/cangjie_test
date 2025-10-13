/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// (not MAC) EXEC: cd dependency && %compiler %cmp_opt --output-type=dylib  *.cj -o libdependency.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output --import-path . -L dependency -ldependency
// (not MAC) RUN-EXEC: %cp ./dependency/libdependency.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args  
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
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>().getStaticFunctions("classStaticMemberFunction_195").size)
        TypeInfo
            .of<StandardStructType<Unit, Unit, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_195")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
            @Expect("assertion#11680: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Unit, UInt32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11681: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Unit, UInt32> got.")
        }
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
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11688: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Unit, UInt32> got.")
        }
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
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(), [NonGenericStruct()])
            @Expect("assertion#11699: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11700: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(), [])
            @Expect("assertion#11701: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11702: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(), [])
            @Expect("assertion#11703: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11704: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11705: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11706: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Unit, UInt32>>(), [()])
            @Expect("assertion#11707: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, Unit, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_195")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11708: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_413(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>().getStaticFunctions("classStaticMemberFunction_196").size)
        TypeInfo
            .of<StandardStructType<Float64, UInt64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_196")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
            @Expect("assertion#11709: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#11710: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, UInt64, UInt16> got.")
        }
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
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#11717: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, UInt64, UInt16> got.")
        }
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
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(), [NonGenericStruct()])
            @Expect("assertion#11728: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11729: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(), [])
            @Expect("assertion#11730: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11731: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(), [])
            @Expect("assertion#11732: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11733: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11734: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11735: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, UInt64, UInt16>>(), [()])
            @Expect("assertion#11736: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_196")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11737: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_414(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>().getStaticFunctions("classStaticMemberFunction_197").size)
        TypeInfo
            .of<StandardStructType<Int8, UInt64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_197")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
            @Expect("assertion#11738: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11739: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11740: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11741: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11742: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11743: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11744: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11745: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11746: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt64, UInt16> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [NonGenericStruct()])
            @Expect("assertion#11747: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#11748: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11749: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11750: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11751: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11752: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11753: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11754: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#11755: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11756: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(), [NonGenericStruct()])
            @Expect("assertion#11757: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11758: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(), [])
            @Expect("assertion#11759: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11760: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(), [])
            @Expect("assertion#11761: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11762: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11763: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11764: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(), [()])
            @Expect("assertion#11765: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11766: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_415(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>().getStaticFunctions("classStaticMemberFunction_198").size)
        TypeInfo
            .of<StandardStructType<UInt8, UInt64, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_198")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#11767: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt64, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11768: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt64, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11769: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11770: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11771: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt64, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11772: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt64, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11773: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#11774: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#11775: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt64, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#11776: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#11777: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11778: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11779: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11780: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11781: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11782: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11783: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#11784: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11785: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(), [NonGenericStruct()])
            @Expect("assertion#11786: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11787: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(), [])
            @Expect("assertion#11788: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11789: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(), [])
            @Expect("assertion#11790: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11791: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11792: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11793: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(), [()])
            @Expect("assertion#11794: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11795: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_416(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>().getStaticFunctions("classStaticMemberFunction_199").size)
        TypeInfo
            .of<StandardStructType<UInt8, Int16, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_199")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
            @Expect("assertion#11796: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int16, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11797: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int16, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11798: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#11799: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11800: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int16, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11801: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int16, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11802: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#11803: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#11804: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int16, Int32> got.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#11805: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#11806: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#11807: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11808: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11809: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11810: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11811: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11812: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#11813: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11814: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(), [NonGenericStruct()])
            @Expect("assertion#11815: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11816: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(), [])
            @Expect("assertion#11817: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11818: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(), [])
            @Expect("assertion#11819: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11820: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11821: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11822: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(), [()])
            @Expect("assertion#11823: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11824: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
