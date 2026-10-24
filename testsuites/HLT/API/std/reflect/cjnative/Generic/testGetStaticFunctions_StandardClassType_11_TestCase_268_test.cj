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
class testGetStaticFunctions_StandardClassType_11 {
    @TestCase
    func TestCase_268(): Unit {
        // logger.info("testcase TestCase_268 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>().getStaticFunctions("classStaticMemberFunction_51").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, Int32, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_51")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [1i32])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [1i32])
            @Expect("assertion#7954: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt32, Int32, UInt16>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7955: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt32, Int32, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7956: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#7957: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7958: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt32, Int32, UInt16>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [1i32, 114.514000f64])
            @Expect("assertion#7959: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt32, Int32, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [1i32, 114.514000f64])
            @Expect("assertion#7960: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#7961: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#7962: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt32, Int32, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [1i32])
            @Expect("assertion#7963: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [1i32])
            @Expect("assertion#7964: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#7965: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7966: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7967: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7968: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [1i32, 114.514000f64])
            @Expect("assertion#7969: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [1i32, 114.514000f64])
            @Expect("assertion#7970: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#7971: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#7972: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(), [1i32])
            @Expect("assertion#7973: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_51' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32])
            @Expect("assertion#7974: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_51' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(), [])
            @Expect("assertion#7975: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_51' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7976: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_51' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(), [])
            @Expect("assertion#7977: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_51' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7978: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_51' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(), [1i32, 114.514000f64])
            @Expect("assertion#7979: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_51' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32, 114.514000f64])
            @Expect("assertion#7980: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_51' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(), [114.514000f64])
            @Expect("assertion#7981: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_51' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#7982: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_51' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_268 ends.")
    }
}
