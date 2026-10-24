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
    func TestCase_283(): Unit {
        // logger.info("testcase TestCase_283 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>().getStaticFunctions("classStaticMemberFunction_66").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, Bool, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_66")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#8389: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt32, Bool, Unit>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8390: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt32, Bool, Unit>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8391: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#8392: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8393: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt32, Bool, Unit>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#8394: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt32, Bool, Unit>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#8395: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8396: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8397: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt32, Bool, Unit>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#8398: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#8399: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#8400: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8401: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8402: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8403: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#8404: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#8405: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [()])
            @Expect("assertion#8406: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8407: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#8408: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_66' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#8409: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_66' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [])
            @Expect("assertion#8410: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_66' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8411: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_66' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [])
            @Expect("assertion#8412: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_66' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8413: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_66' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#8414: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_66' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#8415: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_66' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [()])
            @Expect("assertion#8416: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_66' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8417: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_66' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_283 ends.")
    }
}
