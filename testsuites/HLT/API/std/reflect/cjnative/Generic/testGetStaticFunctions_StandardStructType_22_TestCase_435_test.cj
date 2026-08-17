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
class testGetStaticFunctions_StandardStructType_22 {
    @TestCase
    func TestCase_435(): Unit {
        // logger.info("testcase TestCase_435 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int8, Int32, Float32>>().getStaticFunctions("classStaticMemberFunction_218").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int8, Int32, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_218")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                [GenericStructWith2TypeParameters<Int32, Int32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12347: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int32, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12348: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int32, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#12350: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12351: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int32, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12352: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int32, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12353: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#12354: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#12355: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int32, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12356: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12357: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#12358: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12359: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12360: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12361: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12362: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12363: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#12364: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12365: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12366: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12367: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(), [])
            @Expect("assertion#12368: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12369: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(), [])
            @Expect("assertion#12370: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12371: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12372: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12373: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(), [()])
            @Expect("assertion#12374: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12375: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_435 ends.")
    }
}
