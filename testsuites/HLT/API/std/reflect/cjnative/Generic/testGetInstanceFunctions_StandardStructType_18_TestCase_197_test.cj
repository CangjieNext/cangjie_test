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
    func TestCase_197(): Unit {
        // logger.info("testcase TestCase_197 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_198").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Int32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
            .apply(StandardStructType<Int16, Int32, Int8>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#6240: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
            @Expect("assertion#6241: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6242: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6243: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello",
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6244: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6245: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6246: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6247: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6248: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6249: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6250: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#6251: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#6252: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#6253: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#6254: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6255: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6256: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6257: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6258: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [NonGenericStruct()])
            @Expect("assertion#6259: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#6260: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#6261: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [])
            @Expect("assertion#6262: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6263: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [])
            @Expect("assertion#6264: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [])
            @Expect("assertion#6265: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6266: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [])
            @Expect("assertion#6267: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6268: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6269: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6270: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(StandardStructType<Int16, Int32, Int8>(), [()])
            @Expect("assertion#6271: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6272: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_198")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6273: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_197 ends.")
    }
}
