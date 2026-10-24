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
class testGetStaticFunctions_StandardClassType_20 {
    @TestCase
    func TestCase_314(): Unit {
        // logger.info("testcase TestCase_314 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>().getStaticFunctions("classStaticMemberFunction_97").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, UInt16, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_97")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                [GenericStructWith1TypeParameters<UInt64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9288: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt64, UInt16, UInt64>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9289: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt64, UInt16, UInt64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9290: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9291: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9292: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt64, UInt16, UInt64>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9293: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt64, UInt16, UInt64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9294: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#9295: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#9296: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt64, UInt16, UInt64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9297: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9298: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9299: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9300: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9301: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9302: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9303: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9304: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9305: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9306: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9307: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_97' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#9308: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_97' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(), [])
            @Expect("assertion#9309: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_97' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9310: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_97' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(), [])
            @Expect("assertion#9311: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_97' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9312: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_97' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(),
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9313: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_97' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#9314: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_97' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, UInt16, UInt64>>(), [()])
            @Expect("assertion#9315: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_97' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt16, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_97")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9316: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_97' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_314 ends.")
    }
}
