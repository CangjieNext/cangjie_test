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
class testGetStaticFunctions_StandardClassType_12 {
    @TestCase
    func TestCase_276(): Unit {
        // logger.info("testcase TestCase_276 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Int64, Int64>>().getStaticFunctions("classStaticMemberFunction_59").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Int64, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_59")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#8186: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int32, Int64, Int64>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8187: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int32, Int64, Int64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8188: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8189: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8190: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int32, Int64, Int64>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8191: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int32, Int64, Int64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8192: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8193: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8194: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int32, Int64, Int64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [NonGenericClass()])
            @Expect("assertion#8195: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#8196: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8197: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8198: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8199: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8200: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8201: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8202: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8203: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#8204: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(), [NonGenericClass()])
            @Expect("assertion#8205: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_59' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8206: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_59' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(), [])
            @Expect("assertion#8207: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_59' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8208: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_59' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(), [])
            @Expect("assertion#8209: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_59' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8210: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_59' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8211: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_59' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8212: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_59' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int64>>(), [()])
            @Expect("assertion#8213: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_59' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_59")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8214: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_59' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_276 ends.")
    }
}
