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
    func TestCase_285(): Unit {
        // logger.info("testcase TestCase_285 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>().getStaticFunctions("classStaticMemberFunction_68").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Bool, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_68")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                [GenericClassWith1TypeParameters<UInt64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#8447: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt64, Bool, Int16>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8448: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt64, Bool, Int16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8449: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8450: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8451: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt64, Bool, Int16>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#8452: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt64, Bool, Int16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#8453: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8454: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8455: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt64, Bool, Int16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#8456: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#8457: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8458: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8459: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8460: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8461: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#8462: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#8463: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8464: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8465: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#8466: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_68' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#8467: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_68' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(), [])
            @Expect("assertion#8468: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_68' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8469: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_68' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(), [])
            @Expect("assertion#8470: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_68' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8471: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_68' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#8472: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_68' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#8473: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_68' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(), [()])
            @Expect("assertion#8474: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_68' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8475: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_68' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_285 ends.")
    }
}
