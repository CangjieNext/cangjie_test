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
    func TestCase_304(): Unit {
        // logger.info("testcase TestCase_304 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Unit, Int32>>().getStaticFunctions("classStaticMemberFunction_87").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, Unit, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_87")[0i64]
            .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
            @Expect("assertion#8998: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#8999: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#9000: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [])
            @Expect("assertion#9001: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9002: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9003: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9004: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#9005: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#9006: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [NonGenericStruct()])
            @Expect("assertion#9007: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#9008: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [])
            @Expect("assertion#9009: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9010: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9011: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#9012: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9013: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [()])
            @Expect("assertion#9015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [NonGenericStruct()])
            @Expect("assertion#9017: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#9018: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [])
            @Expect("assertion#9019: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9020: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [])
            @Expect("assertion#9021: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9022: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9023: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9024: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [()])
            @Expect("assertion#9025: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9026: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_304 ends.")
    }
}
