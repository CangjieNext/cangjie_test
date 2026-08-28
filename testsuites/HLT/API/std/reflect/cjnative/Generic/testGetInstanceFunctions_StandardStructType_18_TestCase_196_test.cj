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
    func TestCase_196(): Unit {
        // logger.info("testcase TestCase_196 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Bool, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_197").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Bool, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
            .apply(StandardStructType<UInt16, Bool, UInt8>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [NonGenericStruct()])
            @Expect("assertion#6206: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
            @Expect("assertion#6207: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6208: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6209: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6210: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6211: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6212: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6213: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6214: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6215: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6216: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6217: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6218: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#6219: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#6220: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6221: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6222: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6223: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6224: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [NonGenericStruct()])
            @Expect("assertion#6225: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#6226: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#6227: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [])
            @Expect("assertion#6228: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6229: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [])
            @Expect("assertion#6230: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [])
            @Expect("assertion#6231: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6232: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [])
            @Expect("assertion#6233: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6234: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6235: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6236: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(StandardStructType<UInt16, Bool, UInt8>(), [()])
            @Expect("assertion#6237: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6238: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_197")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6239: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_196 ends.")
    }
}
