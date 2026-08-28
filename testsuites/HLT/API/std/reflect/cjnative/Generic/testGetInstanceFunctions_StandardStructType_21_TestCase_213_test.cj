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
class testGetInstanceFunctions_StandardStructType_21 {
    @TestCase
    func TestCase_213(): Unit {
        // logger.info("testcase TestCase_213 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int8, Int8, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_214").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int8, Int8, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
            .apply(StandardStructType<Int8, Int8, UInt8>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                [GenericStructWith2TypeParameters<Int8, Int8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#6784: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#6785: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6786: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6787: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6788: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6789: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6790: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6791: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#6792: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#6793: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#6794: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6795: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6796: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6797: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#6798: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6799: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6800: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#6801: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6802: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [GenericStructWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#6803: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#6804: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int8, Int8>()])
            @Expect("assertion#6805: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [])
            @Expect("assertion#6806: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6807: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [])
            @Expect("assertion#6808: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [])
            @Expect("assertion#6809: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6810: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [])
            @Expect("assertion#6811: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(),
                    [GenericStructWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#6812: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#6813: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int8, Int8>(), 114.514000f64])
            @Expect("assertion#6814: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(StandardStructType<Int8, Int8, UInt8>(), [()])
            @Expect("assertion#6815: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6816: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_214")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6817: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_213 ends.")
    }
}
