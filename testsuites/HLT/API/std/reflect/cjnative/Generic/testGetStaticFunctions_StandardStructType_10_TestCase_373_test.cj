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
    func TestCase_373(): Unit {
        // logger.info("testcase TestCase_373 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>().getStaticFunctions("classStaticMemberFunction_156").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, UInt8, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_156")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [123i64])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#10549: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt32, UInt8, Int32>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#10550: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt32, UInt8, Int32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#10551: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10552: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10553: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt32, UInt8, Int32>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [123i64, 114.514000f64])
            @Expect("assertion#10554: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt32, UInt8, Int32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#10555: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#10556: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#10557: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt32, UInt8, Int32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [123i64])
            @Expect("assertion#10558: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#10559: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10560: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10561: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#10562: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#10563: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#10564: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#10565: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#10566: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#10567: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(), [123i64])
            @Expect("assertion#10568: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_156' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#10569: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_156' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(), [])
            @Expect("assertion#10570: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_156' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10571: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_156' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(), [])
            @Expect("assertion#10572: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_156' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10573: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_156' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(), [123i64, 114.514000f64])
            @Expect("assertion#10574: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_156' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#10575: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_156' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt8, Int32>>(), [114.514000f64])
            @Expect("assertion#10576: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_156' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_156")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#10577: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_156' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_373 ends.")
    }
}
