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
class testGetStaticFunctions_StandardClassType_13 {
    @TestCase
    func TestCase_278(): Unit {
        // logger.info("testcase TestCase_278 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>().getStaticFunctions("classStaticMemberFunction_61").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, UInt32, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_61")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
            @Expect("assertion#8244: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt32, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8245: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt32, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8246: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8247: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8248: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt32, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8249: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt32, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8250: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8251: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8252: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, UInt32, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [NonGenericClass()])
            @Expect("assertion#8253: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#8254: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8255: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8256: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8257: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8258: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8259: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8260: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8261: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8262: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(), [NonGenericClass()])
            @Expect("assertion#8263: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8264: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(), [])
            @Expect("assertion#8265: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8266: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(), [])
            @Expect("assertion#8267: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8268: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8269: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8270: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, UInt32, Float32>>(), [()])
            @Expect("assertion#8271: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, UInt32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_61")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8272: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_278 ends.")
    }
}
