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
    func TestCase_402(): Unit {
        // logger.info("testcase TestCase_402 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>().getStaticFunctions("classStaticMemberFunction_185").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Unit, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_185")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#11390: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int32, Unit, UInt16>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11391: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int32, Unit, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11392: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11393: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11394: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int32, Unit, UInt16>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#11395: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int32, Unit, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#11396: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#11397: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#11398: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int32, Unit, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#11399: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#11400: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11401: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11402: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11403: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11404: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#11405: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#11406: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11407: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11408: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#11409: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_185' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#11410: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_185' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [])
            @Expect("assertion#11411: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_185' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11412: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_185' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [])
            @Expect("assertion#11413: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_185' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11414: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_185' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#11415: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_185' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#11416: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_185' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt16>>(), [()])
            @Expect("assertion#11417: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_185' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_185")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11418: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_185' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_402 ends.")
    }
}
