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
class testGetInstanceFunctions_StandardClassType_12 {
    @TestCase
    func TestCase_57(): Unit {
        // logger.info("testcase TestCase_57 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, UInt32, Float64>>().getInstanceFunctions("classInstanceMemberFunction_58").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, UInt32, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
            .apply(StandardClassType<UInt64, UInt32, Float64>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#1709: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#1710: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1711: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1712: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1713: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1714: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1715: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1716: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1717: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1718: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1719: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#1720: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#1721: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1722: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#1723: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1724: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1725: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1726: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1727: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [NonGenericClass()])
            @Expect("assertion#1728: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#1729: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#1730: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [])
            @Expect("assertion#1731: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1732: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [])
            @Expect("assertion#1733: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [])
            @Expect("assertion#1734: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1735: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [])
            @Expect("assertion#1736: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1737: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1738: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1739: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [()])
            @Expect("assertion#1740: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1741: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1742: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classInstanceMemberFunction_58' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_57 ends.")
    }
}
