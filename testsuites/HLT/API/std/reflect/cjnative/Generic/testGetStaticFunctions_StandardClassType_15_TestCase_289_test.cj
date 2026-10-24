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
class testGetStaticFunctions_StandardClassType_15 {
    @TestCase
    func TestCase_289(): Unit {
        // logger.info("testcase TestCase_289 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>().getStaticFunctions("classStaticMemberFunction_72").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, UInt8, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_72")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()],
                [GenericClassWith1TypeParameters<Int16>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#8563: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float64, UInt8, Float32>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8564: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float64, UInt8, Float32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8565: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8566: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8567: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float64, UInt8, Float32>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#8568: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float64, UInt8, Float32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#8569: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8570: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8571: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<Float64, UInt8, Float32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#8572: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#8573: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8574: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8575: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8576: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8577: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#8578: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#8579: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#8580: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8581: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#8582: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_72' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#8583: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_72' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(), [])
            @Expect("assertion#8584: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_72' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8585: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_72' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(), [])
            @Expect("assertion#8586: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_72' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8587: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_72' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(),
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#8588: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_72' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#8589: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_72' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt8, Float32>>(), [()])
            @Expect("assertion#8590: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_72' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_72")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8591: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_72' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_289 ends.")
    }
}
