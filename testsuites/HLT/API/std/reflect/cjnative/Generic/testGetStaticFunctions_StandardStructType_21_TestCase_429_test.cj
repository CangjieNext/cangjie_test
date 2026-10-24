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
    func TestCase_429(): Unit {
        // logger.info("testcase TestCase_429 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Unit, Int8>>().getStaticFunctions("classStaticMemberFunction_212").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Unit, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_212")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12173: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Unit, Int8>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12174: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Unit, Int8>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#12175: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [])
            @Expect("assertion#12176: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12177: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Unit, Int8>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12178: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Unit, Int8>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12179: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#12180: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#12181: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Unit, Int8>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12182: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12183: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [])
            @Expect("assertion#12184: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12185: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12186: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [])
            @Expect("assertion#12187: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12188: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12189: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [()])
            @Expect("assertion#12190: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12191: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12192: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_212' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#12193: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_212' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [])
            @Expect("assertion#12194: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_212' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12195: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_212' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [])
            @Expect("assertion#12196: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_212' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12197: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_212' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12198: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_212' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#12199: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_212' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Unit, Int8>>(), [()])
            @Expect("assertion#12200: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_212' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_212")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12201: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_212' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_429 ends.")
    }
}
