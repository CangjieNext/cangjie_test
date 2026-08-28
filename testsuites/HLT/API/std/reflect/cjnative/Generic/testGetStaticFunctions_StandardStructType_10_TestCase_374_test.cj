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
class testGetStaticFunctions_StandardStructType_10 {
    @TestCase
    func TestCase_374(): Unit {
        // logger.info("testcase TestCase_374 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>().getStaticFunctions("classStaticMemberFunction_157").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt8, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_157")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [true])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [true])
            @Expect("assertion#10578: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10579: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10580: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#10581: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10582: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [true, 114.514000f64])
            @Expect("assertion#10583: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [true, 114.514000f64])
            @Expect("assertion#10584: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#10585: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#10586: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt8, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [true])
            @Expect("assertion#10587: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [true])
            @Expect("assertion#10588: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#10589: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10590: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10591: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10592: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [true, 114.514000f64])
            @Expect("assertion#10593: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [true, 114.514000f64])
            @Expect("assertion#10594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#10595: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10596: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [true])
            @Expect("assertion#10597: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [true])
            @Expect("assertion#10598: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [])
            @Expect("assertion#10599: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10600: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [])
            @Expect("assertion#10601: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10602: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [true, 114.514000f64])
            @Expect("assertion#10603: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [true, 114.514000f64])
            @Expect("assertion#10604: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [()])
            @Expect("assertion#10605: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_157")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10606: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_374 ends.")
    }
}
