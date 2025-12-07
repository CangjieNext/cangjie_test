/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// (not MAC) EXEC: cd dependency && %compiler %cmp_opt --output-type=dylib  *.cj -o libdependency.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output --import-path . -L dependency -ldependency
// (not MAC) RUN-EXEC: %cp ./dependency/libdependency.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args  
package testsuite

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*

@Test
class testGetStaticFunctions_StandardClassType_11 {
    @TestCase
    func TestCase_268(): Unit {
        // logger.info("testcase TestCase_268 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>().getStaticFunctions("classStaticMemberFunction_51").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, Int32, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_51")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [1i32])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [1i32])
            @Expect("assertion#7954: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Int32, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7955: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Int32, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7956: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#7957: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7958: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Int32, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [1i32, 114.514000f64])
            @Expect("assertion#7959: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Int32, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [1i32, 114.514000f64])
            @Expect("assertion#7960: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#7961: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#7962: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Int32, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [1i32])
            @Expect("assertion#7963: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [1i32])
            @Expect("assertion#7964: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#7965: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7966: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7967: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#7968: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [1i32, 114.514000f64])
            @Expect("assertion#7969: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [1i32, 114.514000f64])
            @Expect("assertion#7970: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#7971: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#7972: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(), [1i32])
            @Expect("assertion#7973: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32])
            @Expect("assertion#7974: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(), [])
            @Expect("assertion#7975: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7976: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(), [])
            @Expect("assertion#7977: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7978: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(), [1i32, 114.514000f64])
            @Expect("assertion#7979: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i32, 114.514000f64])
            @Expect("assertion#7980: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Int32, UInt16>>(), [114.514000f64])
            @Expect("assertion#7981: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Int32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_51")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#7982: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_268 ends.")
    }

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

    @TestCase
    func TestCase_270(): Unit {
        // logger.info("testcase TestCase_270 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Int32, Int32>>().getStaticFunctions("classStaticMemberFunction_53").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, Int32, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_53")[0i64]
            .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [1i8])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [1i8])
            @Expect("assertion#8012: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int32, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8013: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int32, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [])
            @Expect("assertion#8015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8016: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int32, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [1i8, 114.514000f64])
            @Expect("assertion#8017: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int32, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [1i8, 114.514000f64])
            @Expect("assertion#8018: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#8019: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#8020: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int32, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [1i8])
            @Expect("assertion#8021: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [1i8])
            @Expect("assertion#8022: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [])
            @Expect("assertion#8023: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8024: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8025: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8026: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [1i8, 114.514000f64])
            @Expect("assertion#8027: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [1i8, 114.514000f64])
            @Expect("assertion#8028: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [114.514000f64])
            @Expect("assertion#8029: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#8030: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [1i8])
            @Expect("assertion#8031: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i8])
            @Expect("assertion#8032: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [])
            @Expect("assertion#8033: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8034: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [])
            @Expect("assertion#8035: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8036: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [1i8, 114.514000f64])
            @Expect("assertion#8037: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i8, 114.514000f64])
            @Expect("assertion#8038: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [114.514000f64])
            @Expect("assertion#8039: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#8040: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_270 ends.")
    }

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

    @TestCase
    func TestCase_272(): Unit {
        // logger.info("testcase TestCase_272 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Int32, Unit>>().getStaticFunctions("classStaticMemberFunction_55").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Int32, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_55")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [114.514000f64])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#8070: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8071: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8072: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#8073: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8074: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()],
                    [114.514000f64, 114.514000f64])
            @Expect("assertion#8075: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, 114.514000f64])
            @Expect("assertion#8076: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8077: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8078: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [114.514000f64])
            @Expect("assertion#8079: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#8080: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#8081: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8082: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8083: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8084: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [114.514000f64, 114.514000f64])
            @Expect("assertion#8085: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [114.514000f64, 114.514000f64])
            @Expect("assertion#8086: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#8087: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8088: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [114.514000f64])
            @Expect("assertion#8089: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#8090: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [])
            @Expect("assertion#8091: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8092: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [])
            @Expect("assertion#8093: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8094: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [114.514000f64, 114.514000f64])
            @Expect("assertion#8095: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64, 114.514000f64])
            @Expect("assertion#8096: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [()])
            @Expect("assertion#8097: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8098: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_272 ends.")
    }
}
