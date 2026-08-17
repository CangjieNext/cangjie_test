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
    func TestCase_302(): Unit {
        // logger.info("testcase TestCase_302 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>().getStaticFunctions("classStaticMemberFunction_85").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Int64, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_85")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#8940: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int64, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8941: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int64, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8942: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8943: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8944: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int64, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8945: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int64, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8946: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8947: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8948: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int64, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
            @Expect("assertion#8949: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#8950: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8951: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8952: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8953: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8954: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8955: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8956: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8957: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8958: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [NonGenericStruct()])
            @Expect("assertion#8959: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#8960: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [])
            @Expect("assertion#8961: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8962: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [])
            @Expect("assertion#8963: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8964: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8965: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8966: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int64, UInt8>>(), [()])
            @Expect("assertion#8967: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_85")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8968: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_302 ends.")
    }
}
