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
class testGetStaticFunctions_StandardStructType_12 {
    @TestCase
    func TestCase_386(): Unit {
        // logger.info("testcase TestCase_386 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int64, Float32>>().getStaticFunctions("classStaticMemberFunction_169").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Int64, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_169")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [NonGenericClass()])
            @Expect("assertion#10926: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Int64, Float32>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10927: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Int64, Float32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10928: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#10929: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10930: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Int64, Float32>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10931: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Int64, Float32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10932: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#10933: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#10934: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Int64, Float32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [NonGenericClass()])
            @Expect("assertion#10935: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#10936: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#10937: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10938: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10939: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10940: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10941: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10942: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#10943: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10944: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [NonGenericClass()])
            @Expect("assertion#10945: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_169' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#10946: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_169' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [])
            @Expect("assertion#10947: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_169' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10948: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_169' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [])
            @Expect("assertion#10949: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_169' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10950: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_169' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10951: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_169' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10952: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_169' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [()])
            @Expect("assertion#10953: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_169' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_169")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10954: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_169' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_386 ends.")
    }
}
