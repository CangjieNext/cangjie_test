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
    func TestCase_211(): Unit {
        // logger.info("testcase TestCase_211 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, UInt16, Int32>>().getInstanceFunctions("classInstanceMemberFunction_212").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, UInt16, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
            .apply(StandardStructType<Int64, UInt16, Int32>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6716: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6717: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#6718: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#6719: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6720: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#6721: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6722: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6723: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6724: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6725: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6726: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#6727: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#6728: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#6729: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6730: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6731: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#6732: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6733: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6734: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6735: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6736: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6737: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [])
            @Expect("assertion#6738: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6739: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [])
            @Expect("assertion#6740: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [])
            @Expect("assertion#6741: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6742: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [])
            @Expect("assertion#6743: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6744: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6745: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6746: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(StandardStructType<Int64, UInt16, Int32>(), [()])
            @Expect("assertion#6747: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6748: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_212")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6749: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_211 ends.")
    }
}
