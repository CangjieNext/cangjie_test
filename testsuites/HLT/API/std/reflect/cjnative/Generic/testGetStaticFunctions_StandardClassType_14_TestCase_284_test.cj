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
class testGetStaticFunctions_StandardClassType_14 {
    @TestCase
    func TestCase_284(): Unit {
        // logger.info("testcase TestCase_284 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>().getStaticFunctions("classStaticMemberFunction_67").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, UInt64, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_67")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#8418: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt64, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8419: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8420: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8421: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8422: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt64, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#8423: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#8424: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8425: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8426: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#8427: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#8428: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8429: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8430: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8431: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8432: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#8433: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#8434: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#8435: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8436: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#8437: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#8438: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(), [])
            @Expect("assertion#8439: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8440: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(), [])
            @Expect("assertion#8441: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8442: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#8443: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#8444: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(), [()])
            @Expect("assertion#8445: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8446: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_284 ends.")
    }
}
