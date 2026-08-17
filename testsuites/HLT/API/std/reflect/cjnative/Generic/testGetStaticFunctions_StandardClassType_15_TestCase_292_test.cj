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
    func TestCase_292(): Unit {
        // logger.info("testcase TestCase_292 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>().getStaticFunctions("classStaticMemberFunction_75").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Float64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_75")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8650: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float64, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8651: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8652: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8653: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8654: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float64, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8655: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8656: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8657: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8658: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8659: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8660: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8661: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8662: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8663: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8664: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8665: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8666: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#8667: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8668: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8669: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8670: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(), [])
            @Expect("assertion#8671: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8672: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(), [])
            @Expect("assertion#8673: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8674: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8675: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8676: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float64, UInt16>>(), [()])
            @Expect("assertion#8677: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_75")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8678: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_292 ends.")
    }
}
