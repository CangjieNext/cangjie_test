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
    func TestCase_192(): Unit {
        // logger.info("testcase TestCase_192 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Int8, Bool>>().getInstanceFunctions("classInstanceMemberFunction_193").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Int8, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
            .apply(StandardStructType<UInt16, Int8, Bool>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
            @Expect("assertion#6070: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
            @Expect("assertion#6071: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6072: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(StandardStructType<UInt16, Int8, Bool>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6073: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6074: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6075: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(StandardStructType<UInt16, Int8, Bool>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6076: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6077: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6078: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6079: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(StandardStructType<UInt16, Int8, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6080: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(StandardStructType<UInt16, Int8, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#6081: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#6082: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#6083: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(StandardStructType<UInt16, Int8, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#6084: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(StandardStructType<UInt16, Int8, Bool>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6085: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(StandardStructType<UInt16, Int8, Bool>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6086: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(StandardStructType<UInt16, Int8, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6087: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(StandardStructType<UInt16, Int8, Bool>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6088: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(StandardStructType<UInt16, Int8, Bool>(), [NonGenericStruct()])
            @Expect("assertion#6089: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#6090: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#6091: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(StandardStructType<UInt16, Int8, Bool>(), [])
            @Expect("assertion#6092: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6093: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply("hello", [])
            @Expect("assertion#6094: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(StandardStructType<UInt16, Int8, Bool>(), [])
            @Expect("assertion#6095: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6096: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply("hello", [])
            @Expect("assertion#6097: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(StandardStructType<UInt16, Int8, Bool>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6098: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6099: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6100: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(StandardStructType<UInt16, Int8, Bool>(), [()])
            @Expect("assertion#6101: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6102: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_193")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6103: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_192 ends.")
    }
}
