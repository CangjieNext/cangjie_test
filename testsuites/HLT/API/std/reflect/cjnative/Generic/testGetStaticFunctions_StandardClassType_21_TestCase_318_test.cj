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
class testGetStaticFunctions_StandardClassType_21 {
    @TestCase
    func TestCase_318(): Unit {
        // logger.info("testcase TestCase_318 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Int16, Bool>>().getStaticFunctions("classStaticMemberFunction_101").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Int16, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_101")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()],
                [GenericStructWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#9404: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float32, Int16, Bool>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9405: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float32, Int16, Bool>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9406: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9407: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9408: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float32, Int16, Bool>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#9409: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float32, Int16, Bool>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#9410: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#9411: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#9412: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float32, Int16, Bool>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#9413: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#9414: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9415: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9416: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9417: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9418: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#9419: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#9420: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#9421: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9422: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#9423: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_101' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#9424: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_101' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(), [])
            @Expect("assertion#9425: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_101' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9426: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_101' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(), [])
            @Expect("assertion#9427: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_101' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9428: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_101' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#9429: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_101' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#9430: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_101' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int16, Bool>>(), [()])
            @Expect("assertion#9431: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_101' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_101")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9432: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_101' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_318 ends.")
    }
}
