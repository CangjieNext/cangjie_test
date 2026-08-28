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
class testGetStaticFunctions_StandardClassType_11 {
    @TestCase
    func TestCase_271(): Unit {
        // logger.info("testcase TestCase_271 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>().getStaticFunctions("classStaticMemberFunction_54").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, UInt16, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_54")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [114.514000f64])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#8041: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt16, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8042: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt16, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8043: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8044: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8045: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt16, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [114.514000f64, 114.514000f64])
            @Expect("assertion#8046: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt16, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [114.514000f64, 114.514000f64])
            @Expect("assertion#8047: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8048: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8049: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt16, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#8050: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#8051: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8052: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8053: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8054: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8055: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [114.514000f64, 114.514000f64])
            @Expect("assertion#8056: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [114.514000f64, 114.514000f64])
            @Expect("assertion#8057: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8058: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8059: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(), [114.514000f64])
            @Expect("assertion#8060: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#8061: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(), [])
            @Expect("assertion#8062: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8063: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(), [])
            @Expect("assertion#8064: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8065: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(), [114.514000f64, 114.514000f64])
            @Expect("assertion#8066: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64, 114.514000f64])
            @Expect("assertion#8067: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, UInt8>>(), [()])
            @Expect("assertion#8068: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_54")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8069: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_271 ends.")
    }
}
