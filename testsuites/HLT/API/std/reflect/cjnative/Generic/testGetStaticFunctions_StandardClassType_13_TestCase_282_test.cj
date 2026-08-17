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
class testGetStaticFunctions_StandardClassType_13 {
    @TestCase
    func TestCase_282(): Unit {
        // logger.info("testcase TestCase_282 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>().getStaticFunctions("classStaticMemberFunction_65").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Int16, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_65")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8360: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8361: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8362: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#8363: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8364: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8365: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8366: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8367: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8368: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8369: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8370: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#8371: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8372: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8373: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8374: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8375: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8376: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#8377: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8378: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8379: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8380: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(), [])
            @Expect("assertion#8381: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8382: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(), [])
            @Expect("assertion#8383: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8384: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8385: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8386: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Int16, UInt32>>(), [()])
            @Expect("assertion#8387: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_65")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8388: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_282 ends.")
    }
}
