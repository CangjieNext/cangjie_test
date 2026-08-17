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
class testGetStaticFunctions_StandardStructType_13 {
    @TestCase
    func TestCase_388(): Unit {
        // logger.info("testcase TestCase_388 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>().getStaticFunctions("classStaticMemberFunction_171").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Int32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_171")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericClass()])
            @Expect("assertion#10984: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10985: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10986: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#10987: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10988: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10989: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10990: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#10991: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#10992: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [NonGenericClass()])
            @Expect("assertion#10993: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#10994: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#10995: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10996: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10997: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10998: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10999: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11000: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#11001: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11002: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(), [NonGenericClass()])
            @Expect("assertion#11003: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#11004: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(), [])
            @Expect("assertion#11005: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11006: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(), [])
            @Expect("assertion#11007: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11008: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11009: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11010: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int32, Float64>>(), [()])
            @Expect("assertion#11011: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_171")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11012: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_388 ends.")
    }
}
