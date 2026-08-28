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
class testGetStaticFunctions_StandardStructType_21 {
    @TestCase
    func TestCase_430(): Unit {
        // logger.info("testcase TestCase_430 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, Float32, Float32>>().getStaticFunctions("classStaticMemberFunction_213").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, Float32, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_213")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12202: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Float32, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#12203: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Float32, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#12204: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12205: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12206: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Float32, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12207: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Float32, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12208: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#12209: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#12210: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Float32, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12211: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12212: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12213: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12214: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#12215: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#12216: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12217: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12218: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12219: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12220: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12221: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12222: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(), [])
            @Expect("assertion#12223: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12224: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(), [])
            @Expect("assertion#12225: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12226: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12227: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12228: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Float32, Float32>>(), [()])
            @Expect("assertion#12229: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Float32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_213")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12230: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_430 ends.")
    }
}
