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
class testGetStaticFunctions_StandardClassType_18 {
    @TestCase
    func TestCase_303(): Unit {
        // logger.info("testcase TestCase_303 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>().getStaticFunctions("classStaticMemberFunction_86").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, UInt32, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_86")[0i64]
            .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#8969: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt32, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8970: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt32, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8971: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8972: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8973: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt32, UInt64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8974: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt32, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8975: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#8976: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#8977: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt32, UInt64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#8978: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#8979: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8980: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8981: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8982: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8983: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8984: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8985: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#8986: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8987: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(), [NonGenericStruct()])
            @Expect("assertion#8988: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#8989: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(), [])
            @Expect("assertion#8990: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8991: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(), [])
            @Expect("assertion#8992: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8993: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8994: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#8995: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt32, UInt64>>(), [()])
            @Expect("assertion#8996: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_86")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8997: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_303 ends.")
    }

    @TestCase
    func TestCase_304(): Unit {
        // logger.info("testcase TestCase_304 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, Unit, Int32>>().getStaticFunctions("classStaticMemberFunction_87").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, Unit, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_87")[0i64]
            .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [NonGenericStruct()])
            @Expect("assertion#8998: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#8999: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#9000: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [])
            @Expect("assertion#9001: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9002: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9003: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9004: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#9005: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#9006: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, Unit, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [NonGenericStruct()])
            @Expect("assertion#9007: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#9008: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [])
            @Expect("assertion#9009: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9010: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9011: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#9012: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9013: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [()])
            @Expect("assertion#9015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [NonGenericStruct()])
            @Expect("assertion#9017: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#9018: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [])
            @Expect("assertion#9019: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9020: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [])
            @Expect("assertion#9021: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9022: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9023: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9024: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, Unit, Int32>>(), [()])
            @Expect("assertion#9025: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Unit, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_87")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9026: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_304 ends.")
    }

    @TestCase
    func TestCase_305(): Unit {
        // logger.info("testcase TestCase_305 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>().getStaticFunctions("classStaticMemberFunction_88").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, UInt64, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_88")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#9027: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt64, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9028: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9029: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9030: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9031: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt64, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9032: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9033: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#9034: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#9035: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [NonGenericStruct()])
            @Expect("assertion#9036: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#9037: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9038: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9039: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9040: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#9041: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9042: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9043: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9044: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9045: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(), [NonGenericStruct()])
            @Expect("assertion#9046: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#9047: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(), [])
            @Expect("assertion#9048: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9049: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(), [])
            @Expect("assertion#9050: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9051: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9052: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9053: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt64, Int16>>(), [()])
            @Expect("assertion#9054: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_88")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9055: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_305 ends.")
    }

    @TestCase
    func TestCase_306(): Unit {
        // logger.info("testcase TestCase_306 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>().getStaticFunctions("classStaticMemberFunction_89").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, UInt8, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_89")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#9056: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9057: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9058: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#9059: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9060: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9061: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9062: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9063: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9064: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
            @Expect("assertion#9065: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#9066: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#9067: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9068: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9069: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9070: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9071: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9072: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#9073: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9074: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(), [NonGenericStruct()])
            @Expect("assertion#9075: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#9076: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(), [])
            @Expect("assertion#9077: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9078: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(), [])
            @Expect("assertion#9079: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9080: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9081: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9082: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(), [()])
            @Expect("assertion#9083: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9084: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_306 ends.")
    }

    @TestCase
    func TestCase_307(): Unit {
        // logger.info("testcase TestCase_307 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>().getStaticFunctions("classStaticMemberFunction_90").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, Float32, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_90")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [NonGenericStruct()])
            @Expect("assertion#9085: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Float32, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9086: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Float32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9087: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9088: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9089: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Float32, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9090: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Float32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9091: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#9092: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#9093: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Float32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
            @Expect("assertion#9094: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#9095: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9096: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9097: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9098: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#9099: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9100: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9101: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#9102: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9103: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(), [NonGenericStruct()])
            @Expect("assertion#9104: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#9105: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(), [])
            @Expect("assertion#9106: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9107: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(), [])
            @Expect("assertion#9108: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9109: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9110: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9111: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float32, Int8>>(), [()])
            @Expect("assertion#9112: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_90")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9113: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_307 ends.")
    }
}
