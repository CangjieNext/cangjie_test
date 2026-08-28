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
    func TestCase_210(): Unit {
        // logger.info("testcase TestCase_210 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Float64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_211").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Float64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
            .apply(StandardStructType<UInt8, Float64, Float32>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                [GenericStructWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#6682: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#6683: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6684: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6685: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6686: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6687: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6688: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6689: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#6690: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#6691: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#6692: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6693: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6694: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#6695: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#6696: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [TypeInfo.of<Float64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6697: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6698: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#6699: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6700: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#6701: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#6702: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#6703: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [])
            @Expect("assertion#6704: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6705: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [])
            @Expect("assertion#6706: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [])
            @Expect("assertion#6707: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6708: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [])
            @Expect("assertion#6709: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#6710: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#6711: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#6712: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(StandardStructType<UInt8, Float64, Float32>(), [()])
            @Expect("assertion#6713: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6714: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Float64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_211")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6715: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_210 ends.")
    }
}
