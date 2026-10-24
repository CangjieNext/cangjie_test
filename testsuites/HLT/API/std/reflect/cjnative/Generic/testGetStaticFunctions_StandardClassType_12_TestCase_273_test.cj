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
    func TestCase_273(): Unit {
        // logger.info("testcase TestCase_273 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Int64, Int8>>().getStaticFunctions("classStaticMemberFunction_56").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Int64, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_56")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#8099: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int32, Int64, Int8>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8100: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int32, Int64, Int8>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8101: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#8102: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8103: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int32, Int64, Int8>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8104: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int32, Int64, Int8>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8105: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8106: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8107: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int32, Int64, Int8>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [NonGenericClass()])
            @Expect("assertion#8108: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#8109: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#8110: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8111: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8112: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8113: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8114: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8115: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [()])
            @Expect("assertion#8116: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [NonGenericClass()])
            @Expect("assertion#8118: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_56' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#8119: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_56' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [])
            @Expect("assertion#8120: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_56' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8121: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_56' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [])
            @Expect("assertion#8122: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_56' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8123: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_56' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8124: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_56' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#8125: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_56' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int64, Int8>>(), [()])
            @Expect("assertion#8126: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_56' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_56")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8127: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_56' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_273 ends.")
    }
}
