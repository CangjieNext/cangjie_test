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
}
