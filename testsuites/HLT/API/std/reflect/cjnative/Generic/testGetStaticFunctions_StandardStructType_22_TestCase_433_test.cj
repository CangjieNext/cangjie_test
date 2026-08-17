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
    func TestCase_433(): Unit {
        // logger.info("testcase TestCase_433 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>().getStaticFunctions("classStaticMemberFunction_216").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt16, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_216")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                [GenericStructWith2TypeParameters<UInt8, UInt8>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12289: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt16, Bool> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12290: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt16, Bool> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12291: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#12292: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12293: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt16, Bool> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12294: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt16, Bool> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12295: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12296: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12297: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt16, Bool> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12298: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12299: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#12300: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12301: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12302: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12303: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12304: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12305: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#12306: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12307: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12308: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12309: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(), [])
            @Expect("assertion#12310: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12311: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(), [])
            @Expect("assertion#12312: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12313: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12314: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12315: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(), [()])
            @Expect("assertion#12316: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12317: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_433 ends.")
    }
}
