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
    func TestCase_299(): Unit {
        // logger.info("testcase TestCase_299 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>().getStaticFunctions("classStaticMemberFunction_82").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Int32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_82")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8853: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int32, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8854: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8855: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8856: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8857: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int32, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8858: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8859: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8860: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8861: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Int32, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8862: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8863: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8864: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8865: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8866: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8867: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8868: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8869: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#8870: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8871: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8872: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8873: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(), [])
            @Expect("assertion#8874: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8875: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(), [])
            @Expect("assertion#8876: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8877: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8878: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8879: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Int32, Float64>>(), [()])
            @Expect("assertion#8880: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_82")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8881: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_299 ends.")
    }
}
