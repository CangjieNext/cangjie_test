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
class testGetStaticFunctions_StandardClassType_19 {
    @TestCase
    func TestCase_308(): Unit {
        // logger.info("testcase TestCase_308 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Int32, Int32>>().getStaticFunctions("classStaticMemberFunction_91").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Int32, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_91")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
            @Expect("assertion#9114: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int32, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9115: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int32, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#9116: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#9117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9118: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int32, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9119: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int32, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9120: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#9121: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#9122: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int32, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [NonGenericStruct()])
            @Expect("assertion#9123: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#9124: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#9125: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9126: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9127: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#9128: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9129: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9130: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [()])
            @Expect("assertion#9131: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9132: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [NonGenericStruct()])
            @Expect("assertion#9133: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#9134: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [])
            @Expect("assertion#9135: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9136: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [])
            @Expect("assertion#9137: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9138: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9139: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9140: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int32, Int32>>(), [()])
            @Expect("assertion#9141: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_91")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9142: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_308 ends.")
    }
}
