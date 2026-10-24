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
    func TestCase_321(): Unit {
        // logger.info("testcase TestCase_321 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>().getStaticFunctions("classStaticMemberFunction_104").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Float64, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_104")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                [GenericStructWith2TypeParameters<UInt8, UInt8>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#9491: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt8, Float64, Int8>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9492: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt8, Float64, Int8>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9493: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#9494: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9495: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt8, Float64, Int8>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#9496: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt8, Float64, Int8>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#9497: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#9498: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#9499: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt8, Float64, Int8>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#9500: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#9501: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#9502: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9503: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9504: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9505: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#9506: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#9507: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [()])
            @Expect("assertion#9508: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9509: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(),
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#9510: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_104' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#9511: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_104' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(), [])
            @Expect("assertion#9512: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_104' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9513: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_104' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(), [])
            @Expect("assertion#9514: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_104' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9515: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_104' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(),
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#9516: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_104' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#9517: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_104' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Float64, Int8>>(), [()])
            @Expect("assertion#9518: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_104' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Float64, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_104")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9519: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_104' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_321 ends.")
    }
}
