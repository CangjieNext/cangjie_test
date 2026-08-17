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
class testGetInstanceFunctions_StandardStructType_19 {
    @TestCase
    func TestCase_202(): Unit {
        // logger.info("testcase TestCase_202 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Bool, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_203").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Bool, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
            .apply(StandardStructType<UInt8, Bool, UInt32>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                [GenericStructWith1TypeParameters<Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6410: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6411: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6412: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6413: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6414: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6415: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6416: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6417: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6418: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6419: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6420: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#6421: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#6422: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#6423: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6424: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6425: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6426: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6427: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6428: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6429: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6430: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6431: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [])
            @Expect("assertion#6432: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6433: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [])
            @Expect("assertion#6434: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [])
            @Expect("assertion#6435: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6436: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [])
            @Expect("assertion#6437: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(),
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6438: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6439: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6440: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [()])
            @Expect("assertion#6441: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6442: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6443: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_202 ends.")
    }
}
