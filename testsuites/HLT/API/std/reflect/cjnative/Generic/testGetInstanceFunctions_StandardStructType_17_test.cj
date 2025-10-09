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
class testGetInstanceFunctions_StandardStructType_17 {
    @TestCase
    func TestCase_189(): Unit {
        // logger.info("testcase TestCase_189 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt32, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_190").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, UInt32, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
            .apply(StandardStructType<Bool, UInt32, UInt64>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()],
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5968: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5969: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5970: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5971: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5972: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5973: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5974: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#5975: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5976: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5977: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5978: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#5979: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#5980: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#5981: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5982: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#5983: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#5984: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5985: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#5986: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5987: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5988: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#5989: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [])
            @Expect("assertion#5990: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5991: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply("hello", [])
            @Expect("assertion#5992: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [])
            @Expect("assertion#5993: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(1i64, [])
            @Expect("assertion#5994: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply("hello", [])
            @Expect("assertion#5995: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5996: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5997: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#5998: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(StandardStructType<Bool, UInt32, UInt64>(), [()])
            @Expect("assertion#5999: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6000: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_190")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6001: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_189 ends.")
    }

    @TestCase
    func TestCase_190(): Unit {
        // logger.info("testcase TestCase_190 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, UInt32, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_191").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, UInt32, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
            .apply(StandardStructType<Float32, UInt32, UInt64>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                [GenericClassWith2TypeParameters<Int16, Int16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#6002: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#6003: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6004: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6005: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6006: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6007: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#6008: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6009: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#6010: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#6011: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#6012: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6013: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#6015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#6016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#6017: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6018: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#6019: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6020: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#6021: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#6022: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#6023: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [])
            @Expect("assertion#6024: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6025: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [])
            @Expect("assertion#6026: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [])
            @Expect("assertion#6027: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6028: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [])
            @Expect("assertion#6029: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(),
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#6030: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#6031: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#6032: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [()])
            @Expect("assertion#6033: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6034: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_191")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6035: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_190 ends.")
    }

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

    @TestCase
    func TestCase_193(): Unit {
        // logger.info("testcase TestCase_193 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Float64, Bool>>().getInstanceFunctions("classInstanceMemberFunction_194").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Float64, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
            .apply(StandardStructType<Float64, Float64, Bool>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
            @Expect("assertion#6104: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#6105: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6106: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(StandardStructType<Float64, Float64, Bool>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6107: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6108: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6109: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(StandardStructType<Float64, Float64, Bool>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6110: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6111: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6112: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6113: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(StandardStructType<Float64, Float64, Bool>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6114: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(StandardStructType<Float64, Float64, Bool>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#6115: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#6116: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#6117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(StandardStructType<Float64, Float64, Bool>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#6118: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(StandardStructType<Float64, Float64, Bool>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6119: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(StandardStructType<Float64, Float64, Bool>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6120: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(StandardStructType<Float64, Float64, Bool>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6121: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(StandardStructType<Float64, Float64, Bool>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6122: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(StandardStructType<Float64, Float64, Bool>(), [NonGenericStruct()])
            @Expect("assertion#6123: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#6124: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#6125: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(StandardStructType<Float64, Float64, Bool>(), [])
            @Expect("assertion#6126: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6127: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply("hello", [])
            @Expect("assertion#6128: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(StandardStructType<Float64, Float64, Bool>(), [])
            @Expect("assertion#6129: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6130: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply("hello", [])
            @Expect("assertion#6131: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(StandardStructType<Float64, Float64, Bool>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6132: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6133: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6134: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(StandardStructType<Float64, Float64, Bool>(), [()])
            @Expect("assertion#6135: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6136: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_194")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6137: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_193 ends.")
    }
}
