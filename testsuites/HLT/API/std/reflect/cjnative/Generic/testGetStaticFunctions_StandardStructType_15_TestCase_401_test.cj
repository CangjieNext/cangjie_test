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
class testGetStaticFunctions_StandardStructType_15 {
    @TestCase
    func TestCase_401(): Unit {
        // logger.info("testcase TestCase_401 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>().getStaticFunctions("classStaticMemberFunction_184").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, UInt8, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_184")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11361: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt8, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11362: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt8, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11363: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11364: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11365: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt8, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11366: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt8, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11367: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11368: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11369: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, UInt8, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11370: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11371: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11372: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11373: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11374: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11375: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11376: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11377: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#11378: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11379: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11380: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#11381: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(), [])
            @Expect("assertion#11382: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11383: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(), [])
            @Expect("assertion#11384: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11385: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11386: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#11387: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, UInt8, UInt16>>(), [()])
            @Expect("assertion#11388: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, UInt8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_184")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11389: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_401 ends.")
    }
}
