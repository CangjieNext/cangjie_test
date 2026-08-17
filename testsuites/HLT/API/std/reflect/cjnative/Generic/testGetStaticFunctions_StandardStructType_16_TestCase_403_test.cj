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
class testGetStaticFunctions_StandardStructType_16 {
    @TestCase
    func TestCase_403(): Unit {
        // logger.info("testcase TestCase_403 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>().getStaticFunctions("classStaticMemberFunction_186").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, Int8, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_186")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                [GenericClassWith2TypeParameters<UInt64, UInt64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#11419: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int8, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11420: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int8, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11421: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11422: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11423: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int8, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#11424: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int8, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#11425: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#11426: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#11427: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int8, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#11428: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#11429: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11430: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11431: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11432: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11433: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#11434: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#11435: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11436: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11437: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#11438: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#11439: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(), [])
            @Expect("assertion#11440: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11441: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(), [])
            @Expect("assertion#11442: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11443: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(),
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#11444: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#11445: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>(), [()])
            @Expect("assertion#11446: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_186")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11447: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_403 ends.")
    }
}
