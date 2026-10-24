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
class testGetStaticFunctions_StandardStructType_13 {
    @TestCase
    func TestCase_390(): Unit {
        // logger.info("testcase TestCase_390 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>().getStaticFunctions("classStaticMemberFunction_173").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, Bool, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_173")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericClass()])
            @Expect("assertion#11042: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt64, Bool, UInt16>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11043: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt64, Bool, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11044: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11045: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11046: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt64, Bool, UInt16>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11047: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt64, Bool, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11048: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11049: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11050: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<UInt64, Bool, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#11051: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#11052: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11053: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11054: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11055: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11056: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11057: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11058: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#11059: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11060: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(), [NonGenericClass()])
            @Expect("assertion#11061: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_173' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#11062: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_173' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(), [])
            @Expect("assertion#11063: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_173' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11064: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_173' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(), [])
            @Expect("assertion#11065: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_173' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11066: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_173' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11067: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_173' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#11068: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_173' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Bool, UInt16>>(), [()])
            @Expect("assertion#11069: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_173' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Bool, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_173")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11070: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_173' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_390 ends.")
    }
}
