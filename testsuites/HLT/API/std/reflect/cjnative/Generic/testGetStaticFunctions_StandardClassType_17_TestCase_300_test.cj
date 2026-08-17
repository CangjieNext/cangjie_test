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
class testGetStaticFunctions_StandardClassType_17 {
    @TestCase
    func TestCase_300(): Unit {
        // logger.info("testcase TestCase_300 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>().getStaticFunctions("classStaticMemberFunction_83").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Int32, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_83")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [NonGenericStruct()])
            @Expect("assertion#8882: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8883: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8884: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8885: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8886: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8887: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8888: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8889: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8890: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Int32, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#8891: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#8892: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8893: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8894: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8895: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8896: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8897: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8898: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8899: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8900: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(), [NonGenericStruct()])
            @Expect("assertion#8901: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#8902: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(), [])
            @Expect("assertion#8903: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8904: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(), [])
            @Expect("assertion#8905: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8906: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8907: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8908: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Int32, Unit>>(), [()])
            @Expect("assertion#8909: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_83")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8910: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_300 ends.")
    }
}
