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
class testGetInstanceFunctions_StandardStructType_22 {
    @TestCase
    func TestCase_216(): Unit {
        // logger.info("testcase TestCase_216 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int16, Int8>>().getInstanceFunctions("classInstanceMemberFunction_217").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Int16, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
            .apply(StandardStructType<Bool, Int16, Int8>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                [GenericStructWith2TypeParameters<UInt32, UInt32>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#6886: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#6887: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6888: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6889: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6890: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6891: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6892: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6893: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#6894: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#6895: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#6896: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6897: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6898: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6899: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#6900: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6901: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6902: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#6903: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6904: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#6905: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#6906: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#6907: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [])
            @Expect("assertion#6908: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6909: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [])
            @Expect("assertion#6910: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [])
            @Expect("assertion#6911: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6912: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [])
            @Expect("assertion#6913: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(),
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#6914: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#6915: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#6916: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(StandardStructType<Bool, Int16, Int8>(), [()])
            @Expect("assertion#6917: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6918: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_217")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6919: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_216 ends.")
    }
}
