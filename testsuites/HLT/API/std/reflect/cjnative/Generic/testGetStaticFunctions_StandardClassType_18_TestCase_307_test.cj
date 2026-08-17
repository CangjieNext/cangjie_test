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
    func TestCase_307(): Unit {
        // logger.info("testcase TestCase_307 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>().getStaticFunctions("classStaticMemberFunction_90").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, Float32, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_90")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [NonGenericStruct()])
            @Expect("assertion#9085: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Float32, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9086: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Float32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9087: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9088: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9089: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Float32, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9090: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Float32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9091: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#9092: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#9093: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Float32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
            @Expect("assertion#9094: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#9095: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9096: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9097: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9098: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9099: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9100: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9101: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#9102: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9103: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(), [NonGenericStruct()])
            @Expect("assertion#9104: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#9105: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(), [])
            @Expect("assertion#9106: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9107: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(), [])
            @Expect("assertion#9108: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9109: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9110: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9111: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(), [()])
            @Expect("assertion#9112: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9113: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_307 ends.")
    }
}
