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
class testGetStaticFunctions_StandardStructType_15 {
    @TestCase
    func TestCase_399(): Unit {
        // logger.info("testcase TestCase_399 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>().getStaticFunctions("classStaticMemberFunction_182").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, UInt16, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_182")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                [GenericClassWith1TypeParameters<Int32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#11303: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int32, UInt16, Int8>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11304: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int32, UInt16, Int8>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11305: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11306: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11307: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int32, UInt16, Int8>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#11308: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int32, UInt16, Int8>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#11309: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11310: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11311: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int32, UInt16, Int8>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#11312: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#11313: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11314: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11315: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11316: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11317: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#11318: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#11319: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11320: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11321: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#11322: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_182' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#11323: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_182' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(), [])
            @Expect("assertion#11324: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_182' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11325: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_182' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(), [])
            @Expect("assertion#11326: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_182' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11327: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_182' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(),
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#11328: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_182' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#11329: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_182' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt16, Int8>>(), [()])
            @Expect("assertion#11330: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_182' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_182")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11331: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_182' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_399 ends.")
    }
}
