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
class testGetStaticFunctions_StandardStructType_1 {
    @TestCase
    func TestCase_330(): Unit {
        // logger.info("testcase TestCase_330 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>().getStaticFunctions("classStaticMemberFunction_113").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, UInt64, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_113")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9710: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt64, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9711: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9712: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass()])
            @Expect("assertion#9713: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass()])
            @Expect("assertion#9714: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt64, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#9715: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#9716: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9717: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9718: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt64, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), (), NonGenericClass()])
            @Expect("assertion#9719: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), (), NonGenericClass()])
            @Expect("assertion#9720: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt64, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), ()])
            @Expect("assertion#9721: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), ()])
            @Expect("assertion#9722: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9723: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9724: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9725: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9726: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass()])
            @Expect("assertion#9727: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass()])
            @Expect("assertion#9728: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#9729: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#9730: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9731: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9732: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Int16>(), (), NonGenericClass()])
            @Expect("assertion#9733: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>(), (), NonGenericClass()])
            @Expect("assertion#9734: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), ()])
            @Expect("assertion#9735: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), ()])
            @Expect("assertion#9736: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9737: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9738: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(), [NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9739: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9740: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass()])
            @Expect("assertion#9741: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int16>(), NonGenericClass()])
            @Expect("assertion#9742: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#9743: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), NonGenericClass(), 114.514000f64])
            @Expect("assertion#9744: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9745: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [(), NonGenericClass(), NonGenericClass()])
            @Expect("assertion#9746: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [GenericStructWith1TypeParameters<Int16>(), (), NonGenericClass()])
            @Expect("assertion#9747: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int16>(), (), NonGenericClass()])
            @Expect("assertion#9748: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt64, Int16>>(),
                    [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), ()])
            @Expect("assertion#9749: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_113")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int16>(), NonGenericClass(), ()])
            @Expect("assertion#9750: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_330 ends.")
    }
}
