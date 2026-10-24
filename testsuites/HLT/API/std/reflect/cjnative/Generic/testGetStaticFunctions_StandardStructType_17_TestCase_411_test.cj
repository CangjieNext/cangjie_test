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
class testGetStaticFunctions_StandardStructType_17 {
    @TestCase
    func TestCase_411(): Unit {
        // logger.info("testcase TestCase_411 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>().getStaticFunctions("classStaticMemberFunction_194").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int8, UInt32, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_194")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
            @Expect("assertion#11651: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int8, UInt32, Unit>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11652: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int8, UInt32, Unit>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11653: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11654: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11655: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int8, UInt32, Unit>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11656: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int8, UInt32, Unit>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11657: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11658: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11659: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int8, UInt32, Unit>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#11660: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#11661: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11662: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11663: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11664: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11665: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11666: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11667: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11668: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11669: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(), [NonGenericStruct()])
            @Expect("assertion#11670: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_194' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11671: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_194' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(), [])
            @Expect("assertion#11672: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_194' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11673: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_194' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(), [])
            @Expect("assertion#11674: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_194' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11675: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_194' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11676: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_194' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11677: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_194' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt32, Unit>>(), [()])
            @Expect("assertion#11678: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_194' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_194")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11679: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_194' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_411 ends.")
    }
}
