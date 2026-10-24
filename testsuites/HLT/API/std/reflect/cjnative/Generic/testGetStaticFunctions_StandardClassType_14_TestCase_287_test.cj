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
class testGetStaticFunctions_StandardClassType_14 {
    @TestCase
    func TestCase_287(): Unit {
        // logger.info("testcase TestCase_287 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int8, Float64>>().getStaticFunctions("classStaticMemberFunction_70").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Int8, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_70")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                [GenericClassWith1TypeParameters<Float64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8505: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int16, Int8, Float64>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8506: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int16, Int8, Float64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8507: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8508: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8509: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int16, Int8, Float64>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8510: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int16, Int8, Float64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8511: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8512: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8513: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int16, Int8, Float64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8514: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8515: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8516: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8517: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8518: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8519: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8520: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8521: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8522: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8523: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8524: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_70' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8525: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_70' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(), [])
            @Expect("assertion#8526: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_70' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8527: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_70' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(), [])
            @Expect("assertion#8528: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_70' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8529: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_70' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8530: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_70' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8531: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_70' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(), [()])
            @Expect("assertion#8532: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_70' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8533: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_70' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_287 ends.")
    }
}
