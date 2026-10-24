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
class testGetStaticFunctions_StandardStructType_11 {
    @TestCase
    func TestCase_378(): Unit {
        // logger.info("testcase TestCase_378 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>().getStaticFunctions("classStaticMemberFunction_161").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt8, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_161")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [1i32])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [1i32])
            @Expect("assertion#10694: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Unit, UInt8, Int32>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10695: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Unit, UInt8, Int32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10696: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10697: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10698: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Unit, UInt8, Int32>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [1i32, 114.514000f64])
            @Expect("assertion#10699: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Unit, UInt8, Int32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [1i32, 114.514000f64])
            @Expect("assertion#10700: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#10701: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#10702: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Unit, UInt8, Int32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [1i32])
            @Expect("assertion#10703: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [1i32])
            @Expect("assertion#10704: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10705: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10706: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10707: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10708: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [1i32, 114.514000f64])
            @Expect("assertion#10709: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Bool>()], [1i32, 114.514000f64])
            @Expect("assertion#10710: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#10711: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float64>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#10712: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(), [1i32])
            @Expect("assertion#10713: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_161' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32])
            @Expect("assertion#10714: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_161' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(), [])
            @Expect("assertion#10715: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_161' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10716: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_161' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(), [])
            @Expect("assertion#10717: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_161' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10718: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_161' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(), [1i32, 114.514000f64])
            @Expect("assertion#10719: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_161' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32, 114.514000f64])
            @Expect("assertion#10720: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_161' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt8, Int32>>(), [114.514000f64])
            @Expect("assertion#10721: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_161' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_161")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#10722: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_161' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_378 ends.")
    }
}
