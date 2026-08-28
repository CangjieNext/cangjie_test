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
class testGetStaticFunctions_StandardClassType_22 {
    @TestCase
    func TestCase_326(): Unit {
        // logger.info("testcase TestCase_326 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>().getStaticFunctions("classStaticMemberFunction_109").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, UInt32, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_109")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()],
                [GenericStructWith2TypeParameters<UInt32, UInt32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#9636: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9637: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9638: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9639: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9640: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#9641: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#9642: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#9643: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#9644: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#9645: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#9646: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9647: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9648: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9649: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9650: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#9651: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#9652: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9653: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#9654: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#9655: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#9656: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(), [])
            @Expect("assertion#9657: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9658: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(), [])
            @Expect("assertion#9659: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9660: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(),
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#9661: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#9662: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, UInt16>>(), [()])
            @Expect("assertion#9663: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_109")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9664: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_326 ends.")
    }
}
