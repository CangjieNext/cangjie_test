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
    func TestCase_406(): Unit {
        // logger.info("testcase TestCase_406 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>().getStaticFunctions("classStaticMemberFunction_189").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int8, Int8, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_189")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()],
                [GenericClassWith2TypeParameters<UInt16, UInt16>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#11506: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int8, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11507: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int8, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11508: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11509: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11510: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int8, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#11511: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int8, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#11512: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11513: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11514: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int8, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [GenericClassWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#11515: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#11516: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11517: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11518: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11519: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11520: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#11521: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#11522: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11523: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11524: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [GenericClassWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#11525: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#11526: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(), [])
            @Expect("assertion#11527: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11528: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(), [])
            @Expect("assertion#11529: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11530: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(),
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#11531: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#11532: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>(), [()])
            @Expect("assertion#11533: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_189")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11534: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_406 ends.")
    }
}
