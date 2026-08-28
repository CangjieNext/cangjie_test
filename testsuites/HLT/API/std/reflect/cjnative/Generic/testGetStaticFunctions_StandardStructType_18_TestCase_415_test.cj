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
    func TestCase_415(): Unit {
        // logger.info("testcase TestCase_415 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>().getStaticFunctions("classStaticMemberFunction_198").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, UInt64, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_198")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#11767: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt64, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11768: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt64, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型错误")
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
        // logger.info("类型错误")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型检查失败")
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
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#11775: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, UInt64, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("实参个数与形参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("类型形参个数与类型实参个数不等")
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
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(), [NonGenericStruct()])
            @Expect("assertion#11786: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11787: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(), [])
            @Expect("assertion#11788: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11789: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(), [])
            @Expect("assertion#11790: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11791: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11792: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11793: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, UInt64, UInt64>>(), [()])
            @Expect("assertion#11794: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_198")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11795: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_415 ends.")
    }
}
