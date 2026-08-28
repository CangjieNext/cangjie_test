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
class testGetStaticFunctions_StandardClassType_16 {
    @TestCase
    func TestCase_294(): Unit {
        // logger.info("testcase TestCase_294 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>().getStaticFunctions("classStaticMemberFunction_77").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Float32, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_77")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                [GenericClassWith2TypeParameters<Int16, Int16>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#8708: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, UInt32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8709: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8710: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8711: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8712: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, UInt32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#8713: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#8714: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8715: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8716: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Float32, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#8717: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#8718: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8719: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8720: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8721: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8722: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#8723: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#8724: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8725: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8726: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#8727: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#8728: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(), [])
            @Expect("assertion#8729: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8730: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(), [])
            @Expect("assertion#8731: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8732: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(),
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#8733: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#8734: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Float32, UInt32>>(), [()])
            @Expect("assertion#8735: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Float32, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_77")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8736: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_294 ends.")
    }
}
