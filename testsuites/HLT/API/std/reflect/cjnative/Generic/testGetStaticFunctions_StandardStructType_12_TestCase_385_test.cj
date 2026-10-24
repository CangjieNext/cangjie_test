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
    func TestCase_385(): Unit {
        // logger.info("testcase TestCase_385 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>().getStaticFunctions("classStaticMemberFunction_168").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Bool, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_168")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
            @Expect("assertion#10897: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt32, Bool, Float64>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10898: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt32, Bool, Float64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10899: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10900: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10901: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt32, Bool, Float64>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10902: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt32, Bool, Float64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10903: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#10904: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#10905: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt32, Bool, Float64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#10906: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#10907: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10908: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10909: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10910: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#10911: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10912: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10913: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10915: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(), [NonGenericClass()])
            @Expect("assertion#10916: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_168' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#10917: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_168' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(), [])
            @Expect("assertion#10918: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_168' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10919: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_168' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(), [])
            @Expect("assertion#10920: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_168' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10921: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_168' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10922: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_168' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10923: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_168' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, Bool, Float64>>(), [()])
            @Expect("assertion#10924: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_168' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_168")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10925: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_168' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_385 ends.")
    }
}
