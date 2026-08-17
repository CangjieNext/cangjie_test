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
    func TestCase_269(): Unit {
        // logger.info("testcase TestCase_269 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Bool, Float64>>().getStaticFunctions("classStaticMemberFunction_52").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, Bool, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_52")[0i64]
            .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [114.514000f64])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [114.514000f64])
            @Expect("assertion#7983: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Bool, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#7984: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Bool, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#7985: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#7986: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7987: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Bool, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [114.514000f64, 114.514000f64])
            @Expect("assertion#7988: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Bool, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [114.514000f64, 114.514000f64])
            @Expect("assertion#7989: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#7990: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#7991: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Bool, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#7992: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#7993: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#7994: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7995: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#7996: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#7997: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [114.514000f64, 114.514000f64])
            @Expect("assertion#7998: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>()], [114.514000f64, 114.514000f64])
            @Expect("assertion#7999: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8000: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8001: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(), [114.514000f64])
            @Expect("assertion#8002: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#8003: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(), [])
            @Expect("assertion#8004: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8005: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(), [])
            @Expect("assertion#8006: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8007: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(), [114.514000f64, 114.514000f64])
            @Expect("assertion#8008: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64, 114.514000f64])
            @Expect("assertion#8009: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Bool, Float64>>(), [()])
            @Expect("assertion#8010: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Bool, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_52")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8011: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_269 ends.")
    }
}
