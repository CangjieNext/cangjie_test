/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// (not MAC) EXEC: cd dependency && %compiler %cmp_opt --output-type=dylib  *.cj -o libdependency.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output --import-path . -L dependency -ldependency
// (not MAC) RUN-EXEC: %cp ./dependency/libdependency.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args  
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

    @TestCase
    func TestCase_279(): Unit {
        // logger.info("testcase TestCase_279 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Int64, Float32>>().getStaticFunctions("classStaticMemberFunction_62").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Int64, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_62")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
            @Expect("assertion#8273: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int64, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8274: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8275: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8276: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8277: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int64, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8278: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8279: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8280: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8281: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [NonGenericClass()])
            @Expect("assertion#8282: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#8283: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8284: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8285: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8286: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8287: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8288: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8289: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8290: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8291: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(), [NonGenericClass()])
            @Expect("assertion#8292: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8293: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(), [])
            @Expect("assertion#8294: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8295: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(), [])
            @Expect("assertion#8296: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8297: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8298: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8299: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int64, Float32>>(), [()])
            @Expect("assertion#8300: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_62")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8301: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_279 ends.")
    }

    @TestCase
    func TestCase_280(): Unit {
        // logger.info("testcase TestCase_280 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>().getStaticFunctions("classStaticMemberFunction_63").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, UInt8, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_63")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericClass()])
            @Expect("assertion#8302: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8303: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8304: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#8305: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8306: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8307: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8308: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#8309: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#8310: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [NonGenericClass()])
            @Expect("assertion#8311: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#8312: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#8313: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8314: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8315: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8316: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8317: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8318: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#8319: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8320: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(), [NonGenericClass()])
            @Expect("assertion#8321: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8322: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(), [])
            @Expect("assertion#8323: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8324: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(), [])
            @Expect("assertion#8325: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8326: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8327: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8328: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Float32>>(), [()])
            @Expect("assertion#8329: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_63")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8330: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_280 ends.")
    }

    @TestCase
    func TestCase_281(): Unit {
        // logger.info("testcase TestCase_281 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>().getStaticFunctions("classStaticMemberFunction_64").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, Int32, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_64")[0i64]
            .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
            @Expect("assertion#8331: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Int32, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8332: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Int32, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [])
            @Expect("assertion#8333: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8334: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8335: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Int32, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8336: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Int32, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8337: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8338: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8339: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Int32, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [NonGenericClass()])
            @Expect("assertion#8340: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#8341: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8342: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8343: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8344: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [])
            @Expect("assertion#8345: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8346: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8347: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [()])
            @Expect("assertion#8348: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [NonGenericClass()])
            @Expect("assertion#8350: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8351: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [])
            @Expect("assertion#8352: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8353: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [])
            @Expect("assertion#8354: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8355: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8356: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8357: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Int32, UInt8>>(), [()])
            @Expect("assertion#8358: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_64")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8359: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_281 ends.")
    }

    @TestCase
    func TestCase_282(): Unit {
        // logger.info("testcase TestCase_282 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>().getStaticFunctions("classStaticMemberFunction_65").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Int16, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_65")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8360: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8361: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8362: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#8363: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8364: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8365: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8366: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8367: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8368: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8369: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8370: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#8371: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8372: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8373: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8374: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8375: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8376: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#8377: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8378: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8379: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8380: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(), [])
            @Expect("assertion#8381: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8382: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(), [])
            @Expect("assertion#8383: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8384: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8385: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8386: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(), [()])
            @Expect("assertion#8387: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8388: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_282 ends.")
    }
}
