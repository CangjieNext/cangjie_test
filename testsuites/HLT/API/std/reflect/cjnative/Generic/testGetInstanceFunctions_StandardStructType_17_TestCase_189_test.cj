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
}
