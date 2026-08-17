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
class testGetInstanceFunctions_StandardStructType_17 {
    @TestCase
    func TestCase_191(): Unit {
        // logger.info("testcase TestCase_191 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, Int64, Int8>>().getInstanceFunctions("classInstanceMemberFunction_192").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, Int64, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
            .apply(StandardStructType<Unit, Int64, Int8>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#6036: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#6037: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#6038: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(StandardStructType<Unit, Int64, Int8>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#6039: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6040: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#6041: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(StandardStructType<Unit, Int64, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6042: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6043: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6044: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6045: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(StandardStructType<Unit, Int64, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6046: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(StandardStructType<Unit, Int64, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#6047: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#6048: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#6049: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(StandardStructType<Unit, Int64, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#6050: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(StandardStructType<Unit, Int64, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6051: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(StandardStructType<Unit, Int64, Int8>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#6052: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(StandardStructType<Unit, Int64, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6053: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(StandardStructType<Unit, Int64, Int8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6054: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(StandardStructType<Unit, Int64, Int8>(), [NonGenericStruct()])
            @Expect("assertion#6055: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#6056: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#6057: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(StandardStructType<Unit, Int64, Int8>(), [])
            @Expect("assertion#6058: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6059: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply("hello", [])
            @Expect("assertion#6060: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(StandardStructType<Unit, Int64, Int8>(), [])
            @Expect("assertion#6061: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6062: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply("hello", [])
            @Expect("assertion#6063: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(StandardStructType<Unit, Int64, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6064: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6065: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6066: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(StandardStructType<Unit, Int64, Int8>(), [()])
            @Expect("assertion#6067: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6068: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_192")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6069: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_191 ends.")
    }
}
