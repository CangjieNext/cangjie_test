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
class testGetStaticFunctions_StandardClassType_16 {
    @TestCase
    func TestCase_296(): Unit {
        // logger.info("testcase TestCase_296 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int16, Float32>>().getStaticFunctions("classStaticMemberFunction_79").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Int16, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_79")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                [GenericClassWith2TypeParameters<Float32, Float32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#8766: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int16, Int16, Float32>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8767: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int16, Int16, Float32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8768: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8769: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8770: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int16, Int16, Float32>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#8771: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int16, Int16, Float32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#8772: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8773: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8774: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Int16, Int16, Float32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#8775: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#8776: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8777: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8778: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8779: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8780: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#8781: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#8782: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8783: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8784: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#8785: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_79' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#8786: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_79' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(), [])
            @Expect("assertion#8787: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_79' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8788: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_79' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(), [])
            @Expect("assertion#8789: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_79' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8790: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_79' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(),
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#8791: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_79' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#8792: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_79' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int16, Float32>>(), [()])
            @Expect("assertion#8793: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_79' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int16, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_79")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8794: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_79' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_296 ends.")
    }
}
