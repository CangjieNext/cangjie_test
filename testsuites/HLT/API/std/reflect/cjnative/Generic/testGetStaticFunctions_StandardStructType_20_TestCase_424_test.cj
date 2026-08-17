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
class testGetStaticFunctions_StandardStructType_20 {
    @TestCase
    func TestCase_424(): Unit {
        // logger.info("testcase TestCase_424 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>().getStaticFunctions("classStaticMemberFunction_207").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, Int64, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_207")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Bool>()],
                [GenericStructWith1TypeParameters<UInt64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#12028: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int64, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12029: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int64, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12030: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#12031: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12032: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int64, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#12033: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int64, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#12034: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#12035: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#12036: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int64, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#12037: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#12038: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#12039: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12040: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12041: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12042: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#12043: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#12044: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#12045: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12046: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#12047: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#12048: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(), [])
            @Expect("assertion#12049: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12050: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(), [])
            @Expect("assertion#12051: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12052: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(),
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#12053: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#12054: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int64, UInt64>>(), [()])
            @Expect("assertion#12055: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_207")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12056: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_424 ends.")
    }
}
