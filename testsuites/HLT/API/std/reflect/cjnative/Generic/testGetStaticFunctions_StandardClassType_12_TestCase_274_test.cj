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
class testGetStaticFunctions_StandardClassType_12 {
    @TestCase
    func TestCase_274(): Unit {
        // logger.info("testcase TestCase_274 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>().getStaticFunctions("classStaticMemberFunction_57").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Unit, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_57")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [NonGenericClass()])
            @Expect("assertion#8128: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8129: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8130: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8131: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8132: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8133: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8134: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8135: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8136: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [NonGenericClass()])
            @Expect("assertion#8137: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#8138: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8139: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8140: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8141: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8142: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8143: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8144: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#8145: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8146: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(), [NonGenericClass()])
            @Expect("assertion#8147: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8148: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(), [])
            @Expect("assertion#8149: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8150: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(), [])
            @Expect("assertion#8151: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8152: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8153: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8154: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, UInt64>>(), [()])
            @Expect("assertion#8155: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_57")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8156: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_274 ends.")
    }
}
