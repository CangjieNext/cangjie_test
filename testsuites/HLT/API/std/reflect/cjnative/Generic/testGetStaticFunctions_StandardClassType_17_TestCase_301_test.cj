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
class testGetStaticFunctions_StandardClassType_17 {
    @TestCase
    func TestCase_301(): Unit {
        // logger.info("testcase TestCase_301 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>().getStaticFunctions("classStaticMemberFunction_84").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Float64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_84")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
            @Expect("assertion#8911: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float32, Float64, UInt16>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8912: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float32, Float64, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8913: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8915: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float32, Float64, UInt16>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8916: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float32, Float64, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8917: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8918: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8919: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float32, Float64, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#8920: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#8921: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8922: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8923: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8924: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8925: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8926: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8927: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8928: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8929: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(), [NonGenericStruct()])
            @Expect("assertion#8930: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_84' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#8931: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_84' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(), [])
            @Expect("assertion#8932: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_84' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8933: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_84' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(), [])
            @Expect("assertion#8934: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_84' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8935: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_84' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8936: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_84' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8937: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_84' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Float64, UInt16>>(), [()])
            @Expect("assertion#8938: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_84' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_84")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8939: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_84' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_301 ends.")
    }
}
