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
class testGetInstanceFunctions_StandardStructType_18 {
    @TestCase
    func TestCase_194(): Unit {
        // logger.info("testcase TestCase_194 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_195").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Int32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
            .apply(StandardStructType<Int16, Int32, Int8>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#6138: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#6139: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6140: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6141: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6142: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6143: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6144: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6145: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6146: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6147: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6148: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#6149: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#6150: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#6151: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#6152: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6153: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6154: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6155: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6156: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [NonGenericStruct()])
            @Expect("assertion#6157: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#6158: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#6159: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [])
            @Expect("assertion#6160: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6161: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [])
            @Expect("assertion#6162: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [])
            @Expect("assertion#6163: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6164: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [])
            @Expect("assertion#6165: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6166: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6167: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6168: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [()])
            @Expect("assertion#6169: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6170: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_195")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6171: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_194 ends.")
    }
}
