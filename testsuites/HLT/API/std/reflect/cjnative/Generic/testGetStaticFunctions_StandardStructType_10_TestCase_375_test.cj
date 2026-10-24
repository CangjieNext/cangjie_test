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
    func TestCase_375(): Unit {
        // logger.info("testcase TestCase_375 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>().getStaticFunctions("classStaticMemberFunction_158").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt8, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_158")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#10607: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Unit, UInt8, UInt64>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10608: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Unit, UInt8, UInt64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10610: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10611: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Unit, UInt8, UInt64>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [(), 114.514000f64])
            @Expect("assertion#10612: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Unit, UInt8, UInt64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [(), 114.514000f64])
            @Expect("assertion#10613: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [123i64])
            @Expect("assertion#10614: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [123i64])
            @Expect("assertion#10615: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Unit, UInt8, UInt64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#10616: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10617: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10618: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10619: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10620: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10621: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [(), 114.514000f64])
            @Expect("assertion#10622: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [(), 114.514000f64])
            @Expect("assertion#10623: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [123i64])
            @Expect("assertion#10624: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#10625: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [()])
            @Expect("assertion#10626: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_158' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10627: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_158' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [])
            @Expect("assertion#10628: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_158' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10629: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_158' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [])
            @Expect("assertion#10630: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_158' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10631: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_158' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [(), 114.514000f64])
            @Expect("assertion#10632: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_158' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [(), 114.514000f64])
            @Expect("assertion#10633: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_158' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, UInt64>>(), [123i64])
            @Expect("assertion#10634: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_158' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_158")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#10635: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_158' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_375 ends.")
    }
}
