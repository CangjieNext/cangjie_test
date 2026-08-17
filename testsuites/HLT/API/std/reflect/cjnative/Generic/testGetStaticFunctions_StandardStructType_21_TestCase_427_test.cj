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
    func TestCase_427(): Unit {
        // logger.info("testcase TestCase_427 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Float64, Unit>>().getStaticFunctions("classStaticMemberFunction_210").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Float64, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_210")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                [GenericStructWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#12115: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float64, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12116: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12118: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12119: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float64, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#12120: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#12121: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#12122: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#12123: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Float64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#12124: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#12125: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12126: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12127: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12128: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12129: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#12130: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#12131: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#12132: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12133: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#12134: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#12135: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(), [])
            @Expect("assertion#12136: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12137: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(), [])
            @Expect("assertion#12138: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12139: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#12140: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#12141: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Float64, Unit>>(), [()])
            @Expect("assertion#12142: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_210")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12143: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_427 ends.")
    }
}
