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
class testGetStaticFunctions_StandardStructType_14 {
    @TestCase
    func TestCase_395(): Unit {
        // logger.info("testcase TestCase_395 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int64, Unit>>().getStaticFunctions("classStaticMemberFunction_178").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Int64, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_178")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11187: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11188: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11189: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [])
            @Expect("assertion#11190: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11191: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11192: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11193: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11194: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11195: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11196: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11197: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [])
            @Expect("assertion#11198: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11199: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11200: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11201: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11202: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11203: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [()])
            @Expect("assertion#11204: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11205: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11206: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11207: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [])
            @Expect("assertion#11208: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11209: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [])
            @Expect("assertion#11210: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11211: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11212: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11213: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [()])
            @Expect("assertion#11214: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11215: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_395 ends.")
    }
}
